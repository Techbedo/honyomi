import 'package:flutter/material.dart' hide Colors;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'pages/library_page.dart';
import 'pages/dictionary_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState()..loadSettings(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return FluentApp(
            title: 'Honyomi',
            theme: FluentThemeData(
              brightness: Brightness.light,
              accentColor: Colors.blue,
              visualDensity: VisualDensity.standard,
              focusTheme: const FocusThemeData(
                glowFactor: 0.0,
              ),
            ),
            darkTheme: FluentThemeData(
              brightness: Brightness.dark,
              accentColor: Colors.blue,
              visualDensity: VisualDensity.standard,
              focusTheme: const FocusThemeData(
                glowFactor: 0.0,
              ),
            ),
            themeMode: appState.themeMode,
            locale: appState.locale,
            home: const MainNavigationView(),
          );
        },
      ),
    );
  }
}

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    
    // Simple localization map
    final isUkrainian = appState.currentLocale == AppLocale.ukrainian;
    final texts = {
      'library': isUkrainian ? 'Бібліотека' : 'Library',
      'dictionary': isUkrainian ? 'Словник' : 'Dictionary',
      'settings': isUkrainian ? 'Налаштування' : 'Settings',
      'about': isUkrainian ? 'Про програму' : 'About',
    };
    
    return NavigationView(
      pane: NavigationPane(
        selected: _selectedIndex,
        onChanged: (index) => setState(() => _selectedIndex = index),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.library),
            title: Text(texts['library']!),
            body: const LibraryPage(),
            key: const ValueKey('/library'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.dictionary),
            title: Text(texts['dictionary']!),
            body: const DictionaryPage(),
            key: const ValueKey('/dictionary'),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: Text(texts['settings']!),
            body: const SettingsPage(),
            key: const ValueKey('/settings'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.info),
            title: Text(texts['about']!),
            body: const AboutPage(),
            key: const ValueKey('/about'),
          ),
        ],
      ),
    );
  }
}
