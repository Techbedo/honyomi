import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import '../generated/l10n.dart';

class PdfViewerPage extends StatefulWidget {
  final dynamic arguments;

  const PdfViewerPage({super.key, required this.arguments});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  
  String get fileName {
    if (widget.arguments is Map) {
      return widget.arguments['fileName'] ?? 'Document';
    }
    return (widget.arguments as String).split('/').last;
  }
  
  bool get isWebFile {
    return widget.arguments is Map && widget.arguments['isWeb'] == true;
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
