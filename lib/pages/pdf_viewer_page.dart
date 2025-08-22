import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';
import '../generated/l10n.dart';

class PdfViewerPage extends StatefulWidget {
  final String filePath;

  const PdfViewerPage({super.key, required this.filePath});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filePath.split('/').last),
        actions: [
          IconButton(
            onPressed: () {
              _pdfViewerController.previousPage();
            },
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: S.of(context).previousPage,
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.nextPage();
            },
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: S.of(context).nextPage,
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.zoomLevel = _pdfViewerController.zoomLevel + 0.25;
            },
            icon: const Icon(Icons.zoom_in),
            tooltip: S.of(context).zoomIn,
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.zoomLevel = _pdfViewerController.zoomLevel - 0.25;
            },
            icon: const Icon(Icons.zoom_out),
            tooltip: S.of(context).zoomOut,
          ),
        ],
      ),
      body: SfPdfViewer.file(
        File(widget.filePath),
        controller: _pdfViewerController,
      ),
    );
  }
}
