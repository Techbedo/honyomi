import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, system }
enum AppLocale { english, ukrainian }

class AppState extends ChangeNotifier {
  // Theme state
  AppTheme _currentTheme = AppTheme.system;
  AppLocale _currentLocale = AppLocale.english;
  
  // Recent files state
  List<String> _recentFiles = [];
  
  // PDF viewer state
  String? _currentPdfPath;
  int _currentPage = 1;
  double _zoomLevel = 1.0;
  
  // Dictionary state
  List<Map<String, String>> _dictionaryWords = [];

  // Getters
  AppTheme get currentTheme => _currentTheme;
  AppLocale get currentLocale => _currentLocale;
  List<String> get recentFiles => List.unmodifiable(_recentFiles);
  String? get currentPdfPath => _currentPdfPath;
  int get currentPage => _currentPage;
  double get zoomLevel => _zoomLevel;
  List<Map<String, String>> get dictionaryWords => List.unmodifiable(_dictionaryWords);

  Locale get locale {
    switch (_currentLocale) {
      case AppLocale.ukrainian:
        return const Locale('uk', 'UA');
      case AppLocale.english:
        return const Locale('en', 'US');
    }
  }

  ThemeMode get themeMode {
    switch (_currentTheme) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }

  // Theme methods
  void updateTheme(AppTheme theme) {
    _currentTheme = theme;
    _saveTheme();
    notifyListeners();
  }

  void updateLocale(AppLocale locale) {
    _currentLocale = locale;
    _saveLocale();
    notifyListeners();
  }

  // Recent files methods
  void addRecentFile(String filePath) {
    _recentFiles.remove(filePath); // Remove if already exists
    _recentFiles.insert(0, filePath); // Add to beginning
    if (_recentFiles.length > 10) {
      _recentFiles = _recentFiles.sublist(0, 10); // Keep only last 10
    }
    _saveRecentFiles();
    notifyListeners();
  }

  void clearRecentFiles() {
    _recentFiles.clear();
    _saveRecentFiles();
    notifyListeners();
  }

  // PDF viewer methods
  void setCurrentPdf(String? pdfPath) {
    _currentPdfPath = pdfPath;
    _currentPage = 1;
    _zoomLevel = 1.0;
    if (pdfPath != null) {
      addRecentFile(pdfPath);
    }
    notifyListeners();
  }

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void setZoomLevel(double zoom) {
    _zoomLevel = zoom;
    notifyListeners();
  }

  // Dictionary methods
  void addToDictionary(String word, String translation) {
    _dictionaryWords.add({
      'word': word,
      'translation': translation,
      'dateAdded': DateTime.now().toIso8601String(),
    });
    _saveDictionary();
    notifyListeners();
  }

  void removeDictionaryWord(int index) {
    if (index >= 0 && index < _dictionaryWords.length) {
      _dictionaryWords.removeAt(index);
      _saveDictionary();
      notifyListeners();
    }
  }

  void updateDictionaryWord(int index, String word, String translation) {
    if (index >= 0 && index < _dictionaryWords.length) {
      _dictionaryWords[index] = {
        'word': word,
        'translation': translation,
        'dateAdded': _dictionaryWords[index]['dateAdded'] ?? DateTime.now().toIso8601String(),
      };
      _saveDictionary();
      notifyListeners();
    }
  }

  // Persistence methods
  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load theme
    final themeIndex = prefs.getInt('theme') ?? AppTheme.system.index;
    _currentTheme = AppTheme.values[themeIndex];
    
    // Load locale
    final localeIndex = prefs.getInt('locale') ?? AppLocale.english.index;
    _currentLocale = AppLocale.values[localeIndex];
    
    // Load recent files
    _recentFiles = prefs.getStringList('recentFiles') ?? [];
    
    // Load dictionary
    final dictionaryData = prefs.getStringList('dictionary') ?? [];
    _dictionaryWords = dictionaryData.map((item) {
      final parts = item.split('|');
      return {
        'word': parts.isNotEmpty ? parts[0] : '',
        'translation': parts.length > 1 ? parts[1] : '',
        'dateAdded': parts.length > 2 ? parts[2] : DateTime.now().toIso8601String(),
      };
    }).toList();
    
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', _currentTheme.index);
  }

  Future<void> _saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('locale', _currentLocale.index);
  }

  Future<void> _saveRecentFiles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recentFiles', _recentFiles);
  }

  Future<void> _saveDictionary() async {
    final prefs = await SharedPreferences.getInstance();
    final dictionaryData = _dictionaryWords.map((word) {
      return '${word['word']}|${word['translation']}|${word['dateAdded']}';
    }).toList();
    await prefs.setStringList('dictionary', dictionaryData);
  }
}
