import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import '../generated/l10n.dart';
import '../utils/platform_file_utils.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> recentFiles = [];

  @override
  void initState() {
    super.initState();
    _loadRecentFiles();
  }

  Future<void> _loadRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentFiles = prefs.getStringList('recent_files') ?? [];
    });
  }

  Future<void> _saveRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recent_files', recentFiles);
  }

  void _openPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String? filePath;

      if (kIsWeb) {
        // For web, use the file name since we can't get actual path
        if (result.files.single.name.isNotEmpty) {
          filePath = result.files.single.name;
          // Не додаємо веб-файли до недавніх, оскільки їх неможливо повторно відкрити

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

  void _openRecentFile(String filePath) {
    if (kIsWeb) {
      // Для веб-версії показуємо повідомлення, що файл потрібно перевибрати
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'У веб-версії необхідно перевибрати файл. Використовуйте кнопку "Відкрити файл".',
          ),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 4),
        ),
      );
    } else if (PlatformFileUtils.fileExists(filePath)) {
      _addToRecentFiles(filePath);
      Navigator.pushNamed(context, '/pdf_viewer', arguments: filePath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).fileNotFound),
          backgroundColor: Colors.red,
        ),
      );
      _removeFromRecentFiles(filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).library)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).recentFiles,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: (recentFiles.isEmpty || kIsWeb)
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.folder_open,
                                size: 64,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                kIsWeb
                                    ? 'Натисніть кнопку нижче, щоб відкрити PDF файл'
                                    : S.of(context).noRecentFiles,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                kIsWeb
                                    ? 'У веб-версії файли не зберігаються у списку недавніх'
                                    : S.of(context).noRecentFilesDescription,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: recentFiles.length,
                          itemBuilder: (context, index) {
                            final filePath = recentFiles[index];
                            final fileName = p.basename(filePath);
                            final fileExists = PlatformFileUtils.fileExists(
                              filePath,
                            );

                            return ListTile(
                              leading: Icon(
                                Icons.picture_as_pdf,
                                color: fileExists
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                              ),
                              title: Text(
                                fileName,
                                style: TextStyle(
                                  color: fileExists
                                      ? null
                                      : Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant
                                            .withValues(alpha: 0.7),
                                ),
                              ),
                              subtitle: Text(
                                filePath,
                                style: TextStyle(
                                  color: fileExists
                                      ? Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant
                                      : Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant
                                            .withValues(alpha: 0.5),
                                ),
                              ),
                              trailing: PopupMenuButton(
                                onSelected: (value) {
                                  if (value == 'remove') {
                                    _removeFromRecentFiles(filePath);
                                  }
                                },
                                itemBuilder: (context) => [
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
                              onTap: fileExists
                                  ? () => _openRecentFile(filePath)
                                  : null,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openPdfFile,
        label: Text(S.of(context).openFile),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
