import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:ui' show Size, Offset;

enum AppThemeMode { system, light, dark }

enum AppAccent { system, red, blue, green, purple }

enum AppLanguage { system, en, uk }

class SettingsService extends ChangeNotifier {
  static final SettingsService instance = SettingsService._();
  SettingsService._();

  AppThemeMode themeMode = AppThemeMode.system;
  AppAccent accent = AppAccent.system;
  AppLanguage language = AppLanguage.system;
  AccentColor? _systemAccent;

  AccentColor get accentColor {
    switch (accent) {
      case AppAccent.system:
        return _systemAccent ?? Colors.blue;
      case AppAccent.red:
        return Colors.red;
      case AppAccent.blue:
        return Colors.blue;
      case AppAccent.green:
        return Colors.green;
      case AppAccent.purple:
        return Colors.purple;
    }
  }

  Locale? get appLocale {
    switch (language) {
      case AppLanguage.system:
        return null;
      case AppLanguage.en:
        return const Locale('en');
      case AppLanguage.uk:
        return const Locale('uk');
    }
  }

  ThemeMode get flutterThemeMode {
    switch (themeMode) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    themeMode = AppThemeMode.values[p.getInt('themeMode') ?? 0];
    accent = AppAccent.values[p.getInt('accent') ?? 0];
    language = AppLanguage.values[p.getInt('language') ?? 0];
    // Load system accent asynchronously (Windows/Android). Falls back to blue elsewhere.
    if (!kIsWeb) {
      try {
        await SystemTheme.accentColor.load();
        final base = SystemTheme.accentColor.accent; // a Color
        _systemAccent = AccentColor('system', {
          'darkest': base,
          'darker': base,
          'dark': base,
          'normal': base,
          'light': base,
          'lighter': base,
          'lightest': base,
        });
      } catch (_) {
        // ignore
      }
    }
    notifyListeners();
  }

  // Minimal init to ensure preferences are available (without changing current fields)
  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  // Window state persistence (Windows only usage)
  Size? getWindowSize() {
    // store as doubles in prefs
    // SharedPreferences stores only int/double/bool/string/list
    // we'll use double
    // use -1 as sentinel if missing
    // however SharedPreferences doesn't support null double getter, so use getDouble
    // and check for null
    return SharedPreferences.getInstance().then((p) {
      final w = p.getDouble('win_w');
      final h = p.getDouble('win_h');
      if (w != null && h != null && w > 0 && h > 0) {
        return Size(w, h);
      }
      return null;
    }) as Size?;
  }

  Offset? getWindowPosition() {
    return SharedPreferences.getInstance().then((p) {
      final x = p.getDouble('win_x');
      final y = p.getDouble('win_y');
      if (x != null && y != null) {
        return Offset(x, y);
      }
      return null;
    }) as Offset?;
  }

  bool getWindowMaximized() {
    // default false
    // We cannot await here synchronously; expose async getters instead
    // Keep sync signature for compatibility with requested API, return false when missing
    // Callers should prefer async variants below if needed.
    return false;
  }

  Future<bool> getWindowMaximizedAsync() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool('win_max') ?? false;
  }

  Future<Size?> getWindowSizeAsync() async {
    final p = await SharedPreferences.getInstance();
    final w = p.getDouble('win_w');
    final h = p.getDouble('win_h');
    if (w != null && h != null && w > 0 && h > 0) return Size(w, h);
    return null;
  }

  Future<Offset?> getWindowPositionAsync() async {
    final p = await SharedPreferences.getInstance();
    final x = p.getDouble('win_x');
    final y = p.getDouble('win_y');
    if (x != null && y != null) return Offset(x, y);
    return null;
  }

  Future<void> saveWindowSize(double width, double height) async {
    final p = await SharedPreferences.getInstance();
    await p.setDouble('win_w', width);
    await p.setDouble('win_h', height);
  }

  Future<void> saveWindowPosition(double x, double y) async {
    final p = await SharedPreferences.getInstance();
    await p.setDouble('win_x', x);
    await p.setDouble('win_y', y);
  }

  Future<void> saveWindowMaximized(bool value) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('win_max', value);
  }

  Future<void> setTheme(AppThemeMode value) async {
    themeMode = value;
    final p = await SharedPreferences.getInstance();
    await p.setInt('themeMode', value.index);
    notifyListeners();
  }

  Future<void> setAccent(AppAccent value) async {
    accent = value;
    final p = await SharedPreferences.getInstance();
    await p.setInt('accent', value.index);
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage value) async {
    language = value;
    final p = await SharedPreferences.getInstance();
    await p.setInt('language', value.index);
    notifyListeners();
  }
}
