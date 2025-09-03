import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dictionary_word.dart';
import '../models/word_definition.dart';
import '../services/database_service.dart';

class AppState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');
  List<DictionaryWord> _dictionaryWords = [];
  final DatabaseService _databaseService = DatabaseService();

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  List<DictionaryWord> get dictionaryWords => _dictionaryWords;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Load theme
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    _themeMode = ThemeMode.values[themeIndex];

    // Load locale
    final languageCode = prefs.getString('language_code') ?? 'en';
    _locale = Locale(languageCode);

    // Load dictionary from database
    await _loadDictionaryFromDatabase();

    notifyListeners();
  }

  Future<void> _loadDictionaryFromDatabase() async {
    _dictionaryWords = await _databaseService.getAllWords();
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

  Future<void> addDictionaryWord(
    String word,
    String translation, {
    String? wordType,
  }) async {
    // Створюємо визначення слова
    final definition = WordDefinition(
      wordId: 0, // Буде оновлено після збереження
      partOfSpeech: wordType ?? 'unknown',
      definition: '',
      translation: translation,
      order: 0,
    );

    final newWord = DictionaryWord(
      word: word,
      createdAt: DateTime.now(),
      definitions: [definition],
    );

    final id = await _databaseService.insertWord(newWord);
    final savedWord = newWord.copyWith(id: id);

    _dictionaryWords.add(savedWord);
    _dictionaryWords.sort((a, b) => a.word.compareTo(b.word));
    notifyListeners();
  }

  Future<void> addDictionaryWordWithDefinitions(DictionaryWord word) async {
    final id = await _databaseService.insertWord(word);
    final savedWord = word.copyWith(id: id);

    _dictionaryWords.add(savedWord);
    _dictionaryWords.sort((a, b) => a.word.compareTo(b.word));
    notifyListeners();
  }

  Future<void> updateDictionaryWord(DictionaryWord word) async {
    await _databaseService.updateWord(word);

    final index = _dictionaryWords.indexWhere((w) => w.id == word.id);
    if (index != -1) {
      _dictionaryWords[index] = word;
      _dictionaryWords.sort((a, b) => a.word.compareTo(b.word));
      notifyListeners();
    }
  }

  Future<void> removeDictionaryWord(int id) async {
    await _databaseService.deleteWord(id);
    _dictionaryWords.removeWhere((word) => word.id == id);
    notifyListeners();
  }

  Future<DictionaryWord?> getDictionaryWordById(int id) async {
    return await _databaseService.getWordById(id);
  }

  Future<List<DictionaryWord>> searchDictionaryWords(String query) async {
    return await _databaseService.searchWords(query);
  }

  // Методи для роботи з закладками PDF
  Future<void> saveBookmark(String filePath, int pageNumber) async {
    await _databaseService.saveBookmark(filePath, pageNumber);
  }

  Future<int?> getBookmark(String filePath) async {
    return await _databaseService.getBookmark(filePath);
  }

  Future<void> deleteBookmark(String filePath) async {
    await _databaseService.deleteBookmark(filePath);
  }

  // Експорт та імпорт словника
  Future<List<Map<String, dynamic>>> exportDictionary() async {
    return await _databaseService.exportDictionary();
  }

  Future<void> importDictionary(List<Map<String, dynamic>> data) async {
    await _databaseService.importDictionary(data);
    await _loadDictionaryFromDatabase();
    notifyListeners();
  }

  Future<void> clearDictionary() async {
    await _databaseService.clearDictionary();
    _dictionaryWords.clear();
    notifyListeners();
  }
}
