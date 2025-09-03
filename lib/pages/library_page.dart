import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../utils/platform_file_utils.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> recentFiles = [];
  List<String> pinnedFiles = [];
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  void _showAwesomeSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
  
  @override
  void initState() {
    super.initState();
    _loadRecentFiles();
    _loadPinnedFiles();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentFiles = prefs.getStringList('recent_files') ?? [];
    });
  }

  Future<void> _loadPinnedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pinnedFiles = prefs.getStringList('pinned_files') ?? [];
    });
  }

  Future<void> _saveRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recent_files', recentFiles);
  }

  Future<void> _savePinnedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('pinned_files', pinnedFiles);
  }

  Future<void> _openPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String? filePath;

      if (kIsWeb) {
        // На веб не додаємо файли до недавніх, оскільки їх неможливо повторно відкрити
        if (mounted) {
          // For web, pass the file bytes instead of path
          Navigator.pushNamed(
            context,
            '/pdf_viewer',
            arguments: {
              'isWeb': true,
              'fileName': result.files.single.name,
              'fileBytes': result.files.single.bytes,
            },
          );
        }
      } else {
        // For desktop/mobile platforms
        if (result.files.single.path != null) {
          filePath = result.files.single.path!;
          _addToRecentFiles(filePath);

          if (mounted) {
            Navigator.pushNamed(context, '/pdf_viewer', arguments: filePath);
          }
        }
      }
    }
  }

  void _addToRecentFiles(String filePath) {
    setState(() {
      recentFiles.remove(filePath);
      recentFiles.insert(0, filePath);
      if (recentFiles.length > 10) {
        recentFiles = recentFiles.take(10).toList();
      }
    });
    _saveRecentFiles();
  }

  void _removeFromRecentFiles(String filePath) {
    setState(() {
      recentFiles.remove(filePath);
    });
    _saveRecentFiles();
  }

  void _togglePinFile(String filePath) {
    setState(() {
      if (pinnedFiles.contains(filePath)) {
        pinnedFiles.remove(filePath);
      } else {
        pinnedFiles.add(filePath);
      }
    });
    _savePinnedFiles();
  }

  void _renameFile(String filePath) {
    // Показуємо діалог для перейменування
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController = TextEditingController();
        final fileName = p.basenameWithoutExtension(filePath);
        nameController.text = fileName;
        
        return AlertDialog(
          title: Text(S.of(context).rename),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: S.of(context).rename,
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                // Тут можна додати логіку перейменування файлу
                // Поки що просто закриваємо діалог
                Navigator.pop(context);
                _showAwesomeSnackBar(
                  S.of(context).success,
                  '${S.of(context).rename}: ${nameController.text}',
                  ContentType.success,
                );
              },
              child: Text(S.of(context).save),
            ),
          ],
        );
      },
    );
  }

  void _openRecentFile(String filePath) {
    if (kIsWeb) {
      // Для веб-версії показуємо повідомлення, що файл потрібно перевибрати
      _showAwesomeSnackBar(
        S.of(context).info,
        S.of(context).webVersionMessage,
        ContentType.help,
      );
    } else if (PlatformFileUtils.fileExists(filePath)) {
      _addToRecentFiles(filePath);
      Navigator.pushNamed(context, '/pdf_viewer', arguments: filePath);
    } else {
      _showAwesomeSnackBar(
        S.of(context).error,
        S.of(context).fileNotFound,
        ContentType.failure,
      );
      _removeFromRecentFiles(filePath);
    }
  }

  List<String> get filteredFiles {
    final allFiles = [...pinnedFiles, ...recentFiles.where((file) => !pinnedFiles.contains(file))];
    if (searchQuery.isEmpty) {
      return allFiles;
    }
    return allFiles.where((file) {
      final fileName = p.basename(file).toLowerCase();
      return fileName.contains(searchQuery.toLowerCase());
    }).toList();
  }

  Widget _buildFileList() {
    final files = filteredFiles;
    
    if (files.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.folder_open,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              kIsWeb
                  ? S.of(context).openPdfFilePrompt
                  : S.of(context).noRecentFiles,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              kIsWeb
                  ? S.of(context).webVersionLibraryInfo
                  : S.of(context).noRecentFilesDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Розділяємо файли на закріплені та звичайні
    final pinnedFilesInList = files.where((file) => pinnedFiles.contains(file)).toList();
    final regularFiles = files.where((file) => !pinnedFiles.contains(file)).toList();

    return ListView(
      children: [
        // Закріплені файли
        if (pinnedFilesInList.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              S.of(context).pinnedFiles,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ...pinnedFilesInList.map((filePath) => _buildFileListTile(filePath, isPinned: true)),
          if (regularFiles.isNotEmpty) const Divider(),
        ],
        
        // Звичайні файли
        if (regularFiles.isNotEmpty) ...[
          if (pinnedFilesInList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                S.of(context).recentFiles,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ...regularFiles.map((filePath) => _buildFileListTile(filePath, isPinned: false)),
        ],
      ],
    );
  }

  Widget _buildFileListTile(String filePath, {required bool isPinned}) {
    final fileName = p.basename(filePath);
    final fileExists = !kIsWeb && PlatformFileUtils.fileExists(filePath);

    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPinned)
            Icon(
              Icons.push_pin,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          const SizedBox(width: 4),
          Icon(
            Icons.picture_as_pdf,
            color: fileExists || kIsWeb
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      ),
      title: Text(
        fileName,
        style: TextStyle(
          color: fileExists || kIsWeb
              ? null
              : Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
        ),
      ),
      subtitle: kIsWeb
          ? null
          : Text(
              filePath,
              style: TextStyle(
                color: fileExists
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ),
      trailing: PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case 'remove':
              _removeFromRecentFiles(filePath);
              break;
            case 'pin':
              _togglePinFile(filePath);
              break;
            case 'rename':
              _renameFile(filePath);
              break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'pin',
            child: Row(
              children: [
                Icon(isPinned ? Icons.push_pin_outlined : Icons.push_pin),
                const SizedBox(width: 8),
                Text(isPinned ? S.of(context).unpin : S.of(context).pin),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'rename',
            child: Row(
              children: [
                const Icon(Icons.edit_outlined),
                const SizedBox(width: 8),
                Text(S.of(context).rename),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'remove',
            child: Row(
              children: [
                const Icon(Icons.delete_outline),
                const SizedBox(width: 8),
                Text(S.of(context).remove),
              ],
            ),
          ),
        ],
      ),
      onTap: (fileExists || kIsWeb) ? () => _openRecentFile(filePath) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).library),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: S.of(context).searchFiles,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: (recentFiles.isEmpty && pinnedFiles.isEmpty) || kIsWeb
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.folder_open,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    kIsWeb
                        ? S.of(context).openPdfFilePrompt
                        : S.of(context).noRecentFiles,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    kIsWeb
                        ? S.of(context).webVersionLibraryInfo
                        : S.of(context).noRecentFilesDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : _buildFileList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openPdfFile,
        label: Text(S.of(context).openFile),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
