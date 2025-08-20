import 'package:flutter/foundation.dart' show kIsWeb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:io' show Platform;
import 'package:flutter_acrylic/flutter_acrylic.dart' as acrylic;
import 'package:window_manager/window_manager.dart' as wm;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'src/ui/shell.dart';
import 'src/services/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isWindows) {
    await acrylic.Window.initialize();
    await wm.windowManager.ensureInitialized();
    // Apply mica effect & show window
    await acrylic.Window.setEffect(effect: acrylic.WindowEffect.mica);
    await WindowStateManager.restoreWindowState();
    await wm.windowManager.waitUntilReadyToShow().then((_) async {
      await wm.windowManager.show();
      await wm.windowManager.focus();
    });
    wm.windowManager.addListener(_WindowListener());
  }
  final settings = SettingsService.instance;
  await settings.load();
  runApp(MyApp(settings: settings));
}

class _WindowListener extends wm.WindowListener {
  @override
  void onWindowMove() {
    WindowStateManager.saveWindowState();
  }

  @override
  void onWindowResize() {
    WindowStateManager.saveWindowState();
  }

  @override
  void onWindowMaximize() {
    WindowStateManager.saveWindowState();
  }

  @override
  void onWindowUnmaximize() {
    WindowStateManager.saveWindowState();
  }
}

class WindowStateManager {
  static Future<void> restoreWindowState() async {
    await SettingsService.instance.init();
    final savedSize = await SettingsService.instance.getWindowSizeAsync();
    final savedPosition = await SettingsService.instance.getWindowPositionAsync();
    final savedMaximized = await SettingsService.instance.getWindowMaximizedAsync();

    if (savedSize != null) {
      await wm.windowManager.setSize(savedSize);
    }
    if (savedPosition != null) {
      await wm.windowManager.setPosition(savedPosition);
    } else {
      await wm.windowManager.center();
    }
    if (savedMaximized) {
      await wm.windowManager.maximize();
    }
  }

  static Future<void> saveWindowState() async {
    final size = await wm.windowManager.getSize();
    final position = await wm.windowManager.getPosition();
    final isMaximized = await wm.windowManager.isMaximized();
    await SettingsService.instance.saveWindowSize(size.width, size.height);
    await SettingsService.instance.saveWindowPosition(position.dx, position.dy);
    await SettingsService.instance.saveWindowMaximized(isMaximized);
  }
}

class MyApp extends StatelessWidget {
  final SettingsService settings;
  const MyApp({super.key, required this.settings});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settings,
      builder: (context, _) => FluentApp(
      title: 'Honyomi',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: settings.appLocale,
      themeMode: settings.flutterThemeMode,
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: settings.accentColor,
      ),
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        accentColor: settings.accentColor,
      ),
      home: const AppShell(),
    ),
    );
  }
}

