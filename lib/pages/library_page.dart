import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import '../generated/l10n.dart';
import '../providers/app_state.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> recentFiles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecentFiles();
  }

  Future<void> _loadRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentFiles = prefs.getStringList('recent_files') ?? [];
      isLoading = false;
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

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      _addToRecentFiles(filePath);
      
      if (mounted) {
        Navigator.pushNamed(context, '/pdf_viewer', arguments: filePath);
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
    if (File(filePath).existsSync()) {
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
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).library),
      ),
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
                const SizedBox(height: 8),
                Expanded(
                  child: recentFiles.isEmpty
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
                                S.of(context).noRecentFiles,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                S.of(context).noRecentFilesDescription,
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
                            final fileExists = File(filePath).existsSync();

                            return ListTile(
                              leading: Icon(
                                Icons.picture_as_pdf,
                                color: fileExists
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                              title: Text(
                                fileName,
                                style: TextStyle(
                                  color: fileExists
                                      ? null
                                      : Theme.of(context).colorScheme.onSurfaceVariant,
                                  decoration: fileExists
                                      ? null
                                      : TextDecoration.lineThrough,
                                ),
                              ),
                              subtitle: Text(
                                filePath,
                                style: TextStyle(
                                  color: fileExists
                                      ? Theme.of(context).colorScheme.onSurfaceVariant
                                      : Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6),
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Wrap(
                                        children: [
                                          ListTile(
                                            leading: const Icon(Icons.delete),
                                            title: Text(S.of(context).remove),
                                            onTap: () {
                                              _removeFromRecentFiles(filePath);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
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
