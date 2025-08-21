import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import '../providers/app_state.dart';
import 'pdf_viewer_page.dart';
import 'dart:io';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  
  Future<void> _openPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    
    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      final appState = context.read<AppState>();
      appState.setCurrentPdf(filePath);
      
      if (mounted) {
        Navigator.of(context).push(
          FluentPageRoute(
            builder: (context) => PDFViewerPage(pdfPath: filePath),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Library'),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Open PDF Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _openPdf,
                    child: const Text('Open PDF'),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Recent Files Section
                Text(
                  'Recently Opened',
                  style: FluentTheme.of(context).typography.subtitle,
                ),
                const SizedBox(height: 16),
                
                Expanded(
                  child: appState.recentFiles.isEmpty 
                    ? const Center(
                        child: Text(
                          'No recent files',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: appState.recentFiles.length,
                        itemBuilder: (context, index) {
                          final filePath = appState.recentFiles[index];
                          final fileName = filePath.split(Platform.pathSeparator).last;
                          final file = File(filePath);
                          final exists = file.existsSync();
                          
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                FluentIcons.pdf,
                                color: exists ? null : Colors.grey,
                              ),
                              title: Text(
                                fileName,
                                style: TextStyle(
                                  color: exists ? null : Colors.grey,
                                ),
                              ),
                              subtitle: Text(
                                exists ? filePath : 'File not found',
                                style: TextStyle(
                                  color: exists ? Colors.grey : Colors.errorPrimaryColor,
                                ),
                              ),
                              onPressed: exists ? () {
                                appState.setCurrentPdf(filePath);
                                Navigator.of(context).push(
                                  FluentPageRoute(
                                    builder: (context) => PDFViewerPage(pdfPath: filePath),
                                  ),
                                );
                              } : null,
                              trailing: IconButton(
                                icon: const Icon(FluentIcons.delete),
                                onPressed: () {
                                  // Remove from recent files
                                  final currentFiles = List<String>.from(appState.recentFiles);
                                  currentFiles.remove(filePath);
                                  appState.clearRecentFiles();
                                  for (final path in currentFiles) {
                                    appState.addRecentFile(path);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
