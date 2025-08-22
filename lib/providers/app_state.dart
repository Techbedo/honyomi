import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');
  final List<Map<String, String>> _dictionaryWords = [];

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  List<Map<String, String>> get dictionaryWords => _dictionaryWords;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load theme
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    _themeMode = ThemeMode.values[themeIndex];
    
    // Load locale
    final languageCode = prefs.getString('language_code') ?? 'en';
    _locale = Locale(languageCode);
    
    // Load dictionary
    final dictionary = prefs.getStringList('dictionary') ?? [];
    _dictionaryWords.clear();
    for (final entry in dictionary) {
      final parts = entry.split('|');
      if (parts.length == 2) {
        _dictionaryWords.add({
          'word': parts[0],
          'translation': parts[1],
        });
      }
    }
    
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    notifyListeners();
  }

  Future<void> addDictionaryWord(String word, String translation) async {
    _dictionaryWords.add({
      'word': word,
      'translation': translation,
    });
    await _saveDictionary();
    notifyListeners();
  }

  Future<void> removeDictionaryWord(int index) async {
    if (index >= 0 && index < _dictionaryWords.length) {
      _dictionaryWords.removeAt(index);
      await _saveDictionary();
      notifyListeners();
    }
  }

  Future<void> _saveDictionary() async {
    final prefs = await SharedPreferences.getInstance();
    final dictionary = _dictionaryWords
        .map((entry) => '|')
        .toList();
    await prefs.setStringList('dictionary', dictionary);
  }
}
