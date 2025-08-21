import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../providers/app_state.dart';
import 'dart:io';

class PDFViewerPage extends StatefulWidget {
  final String pdfPath;
  
  const PDFViewerPage({
    super.key,
    required this.pdfPath,
  });

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  
  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final fileName = widget.pdfPath.split(Platform.pathSeparator).last;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(fileName),
        commandBar: CommandBar(
          primaryItems: [
            // Previous Page
            CommandBarButton(
              icon: const Icon(FluentIcons.chevron_left),
              label: const Text('Previous Page'),
              onPressed: _pdfViewerController.previousPage,
            ),
            // Next Page
            CommandBarButton(
              icon: const Icon(FluentIcons.chevron_right),
              label: const Text('Next Page'),
              onPressed: _pdfViewerController.nextPage,
            ),
            // Zoom In
            CommandBarButton(
              icon: const Icon(FluentIcons.add),
              label: const Text('Zoom In'),
              onPressed: () {
                _pdfViewerController.zoomLevel += 0.25;
              },
            ),
            // Zoom Out
            CommandBarButton(
              icon: const Icon(FluentIcons.remove),
              label: const Text('Zoom Out'),
              onPressed: () {
                if (_pdfViewerController.zoomLevel > 0.25) {
                  _pdfViewerController.zoomLevel -= 0.25;
                }
              },
            ),
            // Add Bookmark
            CommandBarButton(
              icon: const Icon(FluentIcons.heart),
              label: const Text('Add Bookmark'),
              onPressed: () {
                // TODO: Implement bookmark functionality
                showDialog(
                  context: context,
                  builder: (context) => ContentDialog(
                    title: const Text('Bookmark'),
                    content: const Text('Bookmark functionality will be implemented soon.'),
                    actions: [
                      Button(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Close PDF
            CommandBarButton(
              icon: const Icon(FluentIcons.cancel),
              label: const Text('Close PDF'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      content: SfPdfViewer.file(
        File(widget.pdfPath),
        key: _pdfViewerKey,
        controller: _pdfViewerController,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          // Update page count in app state if needed
        },
        onPageChanged: (PdfPageChangedDetails details) {
          appState.setCurrentPage(details.newPageNumber);
        },
        onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
          if (details.selectedText != null && details.selectedText!.isNotEmpty) {
            _showContextMenu(context, details.selectedText!);
          }
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, String selectedText) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Text Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Selected: "$selectedText"'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  child: const Text('Copy'),
                  onPressed: () {
                    // TODO: Implement copy to clipboard
                    Navigator.of(context).pop();
                  },
                ),
                Button(
                  child: const Text('Add to Dictionary'),
                  onPressed: () {
                    final appState = context.read<AppState>();
                    appState.addToDictionary(selectedText, '');
                    Navigator.of(context).pop();
                    _showSnackBar('Added to dictionary');
                  },
                ),
                Button(
                  child: const Text('Translate'),
                  onPressed: () {
                    // TODO: Implement translation
                    Navigator.of(context).pop();
                    _showTranslateDialog(selectedText);
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showTranslateDialog(String text) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Translate'),
        content: Text('Translation functionality for "$text" will be implemented soon.'),
        actions: [
          Button(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    // TODO: Implement snackbar functionality in Fluent UI
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          Button(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
