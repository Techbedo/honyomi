import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:window_manager/window_manager.dart' as wm;
import 'package:window_manager/window_manager.dart' show DragToMoveArea;
import '../../generated/l10n.dart';
import 'pages/reader_page.dart';
import 'pages/dictionary_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isWindows = !kIsWeb && Platform.isWindows;
    return NavigationView(
      appBar: NavigationAppBar(
        title: const Text('Honyomi'),
        height: isWindows ? 36.0 : 36.0,
        leading: isWindows
            ? DragToMoveArea(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(FluentIcons.app_icon_default, color: FluentTheme.of(context).accentColor),
                  ),
                ),
              )
            : null,
        actions: isWindows
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(FluentIcons.chrome_minimize),
                  onPressed: () => wm.windowManager.minimize(),
                ),
                IconButton(
                  icon: const Icon(FluentIcons.chrome_restore),
                  onPressed: () async {
                    final isMax = await wm.windowManager.isMaximized();
                    if (isMax) {
                      await wm.windowManager.unmaximize();
                    } else {
                      await wm.windowManager.maximize();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(FluentIcons.chrome_close),
                  onPressed: () => wm.windowManager.close(),
                ),
              ])
            : null,
      ),
      pane: NavigationPane(
        selected: _index,
        onChanged: (i) => setState(() => _index = i),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.open_file),
            title: Text(s.nav_reader),
            body: const ReaderPage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.book_answers),
            title: Text(s.nav_dictionary),
            body: const DictionaryPage(),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: Text(s.nav_settings),
            body: const SettingsPage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.info),
            title: Text(s.about),
            body: const AboutPage(),
          ),
        ],
      ),
    );
  }
}
