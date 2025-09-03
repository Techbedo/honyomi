import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';
import '../widgets/add_word_dialog.dart';

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

  void _showAwesomeSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
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

  Future<void> _showAddWordDialog(String selectedText) async {
    await showDialog(
      context: context,
      builder: (context) => AddWordDialog(
        initialWord: selectedText.trim(),
        onWordAdded: (word, translation, wordType) async {
          final appState = Provider.of<AppState>(context, listen: false);
          await appState.addDictionaryWord(word, translation, wordType: wordType);
          _showAwesomeSnackBar(
            S.of(context).wordAdded,
            S.of(context).wordAddedMessage(word, translation),
            ContentType.success,
          );
        },
      ),
    );
  }

  Widget? _buildContextMenu(BuildContext context, PdfViewerContextMenuBuilderParams params) {
    final l10n = S.of(context);
    final items = <ContextMenuButtonItem>[];

    // Додаємо стандартні опції для вибору тексту
    if (params.isTextSelectionEnabled &&
        params.textSelectionDelegate.isCopyAllowed &&
        params.textSelectionDelegate.hasSelectedText) {
      items.add(
        ContextMenuButtonItem(
          onPressed: () => params.textSelectionDelegate.copyTextSelection(),
          label: l10n.copy,
          type: ContextMenuButtonType.copy,
        ),
      );
    }

    if (params.isTextSelectionEnabled && !params.textSelectionDelegate.isSelectingAllText) {
      items.add(
        ContextMenuButtonItem(
          onPressed: () => params.textSelectionDelegate.selectAllText(),
          label: l10n.selectAll,
          type: ContextMenuButtonType.selectAll,
        ),
      );
    }

    // Додаємо нашу кнопку "Add Word"
    if (params.isTextSelectionEnabled && params.textSelectionDelegate.hasSelectedText) {
      items.add(
        ContextMenuButtonItem(
          onPressed: () async {
            final selectedText = await params.textSelectionDelegate.getSelectedText();
            _showAddWordDialog(selectedText);
          },
          label: l10n.addWord,
          type: ContextMenuButtonType.custom,
        ),
      );
    }

    if (items.isEmpty) {
      return null;
    }

    return Align(
      alignment: Alignment.topLeft,
      child: AdaptiveTextSelectionToolbar.buttonItems(
        anchors: TextSelectionToolbarAnchors(
          primaryAnchor: params.anchorA,
          secondaryAnchor: params.anchorB,
        ),
        buttonItems: items,
      ),
    );
  }

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
          _showAwesomeSnackBar(
            'Bookmark',
            S.of(context).bookmarkResumed(bookmark),
            ContentType.success,
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
              params: PdfViewerParams(
                boundaryMargin: const EdgeInsets.all(16.0),
                minScale: 1.0,
                maxScale: 10.0,
                buildContextMenu: _buildContextMenu,
              ),
            )
          : PdfViewer.file(
              widget.arguments as String,
              controller: _pdfViewerController,
              params: PdfViewerParams(
                boundaryMargin: const EdgeInsets.all(16.0),
                minScale: 1.0,
                maxScale: 10.0,
                buildContextMenu: _buildContextMenu,
              ),
            ),
    );
  }
}
