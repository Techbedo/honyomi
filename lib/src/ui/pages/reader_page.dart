import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:pdfrx/pdfrx.dart';
import '../../../generated/l10n.dart';
import '../../utils/selection_flyout.dart';
import '../../utils/jmdict_tooltip.dart';

class ReaderPage extends StatefulWidget {
  const ReaderPage({super.key});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  Uint8List? _pdfBytes;
  final PdfViewerController _controller = PdfViewerController();
  final FlyoutController _flyoutController = FlyoutController();
  String _selectedText = '';

  Future<void> _openPdf() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.bytes != null) {
      setState(() => _pdfBytes = result.files.single.bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldPage(
      header: PageHeader(
        title: Text(s.nav_reader),
        commandBar: Row(children: [
          FilledButton(onPressed: _openPdf, child: Text(s.open_pdf)),
        ]),
      ),
      content: _pdfBytes == null
          ? Center(child: Text(s.no_document))
          : FocusTraversalGroup(
              child: JMDictTooltip(
                child: FlyoutTarget(
                  controller: _flyoutController,
                  child: PdfViewer.data(
                    _pdfBytes!,
                    sourceName: 'picked.pdf',
                    controller: _controller,
                    params: PdfViewerParams(
                      textSelectionParams: const PdfTextSelectionParams(
                        enabled: true,
                      ),
                      buildContextMenu: (context, params) {
                        // Fetch selected text asynchronously and show Fluent flyout
                        Future<void>(() async {
                          final sel = await params.textSelectionDelegate.getSelectedText();
                          final text = sel.trim();
                          if (text.isEmpty) return;
                          _selectedText = text;
                          await _flyoutController.showFlyout(
                            barrierDismissible: true,
                            builder: (ctx) => SelectionFlyout(
                              selectedText: _selectedText,
                              onSelectAll: () async {
                                await Clipboard.setData(ClipboardData(text: _selectedText));
                              },
                            ),
                          );
                        });
                        return null; // suppress default context menu
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
