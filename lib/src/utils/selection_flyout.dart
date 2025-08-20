import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import '../../../generated/l10n.dart';
import '../services/translator_service.dart';

class SelectionFlyout extends StatelessWidget {
  final String selectedText;
  final VoidCallback? onSelectAll;
  const SelectionFlyout({super.key, required this.selectedText, this.onSelectAll});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return FlyoutContent(
      constraints: const BoxConstraints(maxWidth: 240),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Button(child: Text(s.copy), onPressed: () async {
          if (selectedText.isNotEmpty) {
            await Clipboard.setData(ClipboardData(text: selectedText));
          }
          Flyout.of(context).close();
        }),
        Button(child: Text(s.select_all), onPressed: () {
          onSelectAll?.call();
          Flyout.of(context).close();
        }),
        Button(child: Text(s.add_to_dictionary), onPressed: () {
          // TODO: Persist to user dictionary
          Flyout.of(context).close();
        }),
        Button(child: Text(s.translate), onPressed: () async {
          if (selectedText.isEmpty) return;
          final result = await TranslatorService.instance.translate(selectedText, to: 'uk');
          displayInfoBar(context, builder: (context, close) {
            return InfoBar(
              title: Text(s.translate),
              content: Text(result ?? s.translation_error),
              action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
            );
          });
          Flyout.of(context).close();
        }),
      ]),
    );
  }
}
