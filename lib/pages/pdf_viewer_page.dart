import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdfrx/pdfrx.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';

class PdfViewerPage extends StatefulWidget {
  final dynamic arguments;

  const PdfViewerPage({super.key, required this.arguments});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  int? _lastPage;
  bool _bookmarkLoaded = false;

  String get fileName {
    if (widget.arguments is Map) {
      return widget.arguments['fileName'] ?? 'Document';
    }
    return (widget.arguments as String).split('/').last;
  }

  String get filePath {
    if (widget.arguments is Map) {
      return widget.arguments['filePath'] ??
          widget.arguments['fileName'] ??
          'unknown';
    }
    return widget.arguments as String;
  }

  bool get isWebFile {
    return widget.arguments is Map && widget.arguments['isWeb'] == true;
  }

  @override
  void initState() {
    super.initState();
    _loadBookmark();

    // Відстежуємо зміни сторінки для автозбереження закладок
    _pdfViewerController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _saveCurrentBookmark();
    _pdfViewerController.removeListener(_onPageChanged);
    super.dispose();
  }

  Future<void> _loadBookmark() async {
    if (_bookmarkLoaded) return;

    final appState = Provider.of<AppState>(context, listen: false);
    final bookmark = await appState.getBookmark(filePath);

    if (bookmark != null && bookmark > 1) {
      // Очікуємо поки PDF завантажиться
      await Future.delayed(const Duration(milliseconds: 500));

      if (_pdfViewerController.isReady && mounted) {
        _pdfViewerController.goToPage(pageNumber: bookmark);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).bookmarkResumed(bookmark)),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    }

    _bookmarkLoaded = true;
  }

  void _onPageChanged() {
    if (_pdfViewerController.isReady) {
      final currentPage = _pdfViewerController.pageNumber;
      if (currentPage != null && currentPage != _lastPage) {
        _lastPage = currentPage;
        _saveCurrentBookmark();
      }
    }
  }

  Future<void> _saveCurrentBookmark() async {
    if (_pdfViewerController.isReady && _lastPage != null) {
      final appState = Provider.of<AppState>(context, listen: false);
      await appState.saveBookmark(filePath, _lastPage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        actions: [
          IconButton(
            onPressed: () {
              if (_pdfViewerController.isReady) {
                final currentPage = _pdfViewerController.pageNumber;
                if (currentPage != null && currentPage > 1) {
                  _pdfViewerController.goToPage(pageNumber: currentPage - 1);
                }
              }
            },
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: S.of(context).previousPage,
          ),
          IconButton(
            onPressed: () {
              if (_pdfViewerController.isReady) {
                final currentPage = _pdfViewerController.pageNumber;
                final pageCount = _pdfViewerController.pageCount;
                if (currentPage != null && currentPage < pageCount) {
                  _pdfViewerController.goToPage(pageNumber: currentPage + 1);
                }
              }
            },
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: S.of(context).nextPage,
          ),
          IconButton(
            onPressed: () {
              if (_pdfViewerController.isReady) {
                _pdfViewerController.zoomUp();
              }
            },
            icon: const Icon(Icons.zoom_in),
            tooltip: S.of(context).zoomIn,
          ),
          IconButton(
            onPressed: () {
              if (_pdfViewerController.isReady) {
                _pdfViewerController.zoomDown();
              }
            },
            icon: const Icon(Icons.zoom_out),
            tooltip: S.of(context).zoomOut,
          ),
        ],
      ),
      body: isWebFile
          ? PdfViewer.data(
              widget.arguments['fileBytes'],
              sourceName: fileName,
              controller: _pdfViewerController,
              params: const PdfViewerParams(
                boundaryMargin: EdgeInsets.all(16.0),
                minScale: 1.0,
                maxScale: 10.0,
              ),
            )
          : PdfViewer.file(
              widget.arguments as String,
              controller: _pdfViewerController,
              params: const PdfViewerParams(
                boundaryMargin: EdgeInsets.all(16.0),
                minScale: 1.0,
                maxScale: 10.0,
              ),
            ),
    );
  }
}
