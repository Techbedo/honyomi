import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../models/dictionary_word.dart';
import '../models/word_definition.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Ініціалізація для Windows
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'honyomi.db');

    return await openDatabase(path, version: 3, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Основна таблиця слів
    await db.execute('''
      CREATE TABLE dictionary_words(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT NOT NULL,
        pronunciation TEXT,
        is_favorite INTEGER DEFAULT 0,
        created_at INTEGER NOT NULL,
        updated_at INTEGER
      )
    ''');

    // Таблиця визначень слів
    await db.execute('''
      CREATE TABLE word_definitions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word_id INTEGER NOT NULL,
        part_of_speech TEXT NOT NULL,
        definition TEXT NOT NULL,
        translation TEXT NOT NULL,
        example TEXT,
        example_translation TEXT,
        order_index INTEGER DEFAULT 0,
        FOREIGN KEY (word_id) REFERENCES dictionary_words (id) ON DELETE CASCADE
      )
    ''');

    // Індекси для швидкого пошуку
    await db.execute('''
      CREATE INDEX idx_word ON dictionary_words(word)
    ''');

    await db.execute('''
      CREATE INDEX idx_word_id ON word_definitions(word_id)
    ''');

    // Таблиця для зберігання закладок PDF
    await db.execute('''
      CREATE TABLE pdf_bookmarks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        file_path TEXT NOT NULL,
        page_number INTEGER NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER,
        UNIQUE(file_path)
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Міграція з версії 1 до версії 2
      
      // Створюємо нову таблицю визначень
      await db.execute('''
        CREATE TABLE word_definitions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          word_id INTEGER NOT NULL,
          part_of_speech TEXT NOT NULL,
          definition TEXT NOT NULL,
          translation TEXT NOT NULL,
          example TEXT,
          example_translation TEXT,
          order_index INTEGER DEFAULT 0,
          FOREIGN KEY (word_id) REFERENCES dictionary_words (id) ON DELETE CASCADE
        )
      ''');

      // Додаємо нові колонки до існуючої таблиці
      await db.execute('''
        ALTER TABLE dictionary_words ADD COLUMN pronunciation TEXT
      ''');

      await db.execute('''
        ALTER TABLE dictionary_words ADD COLUMN is_favorite INTEGER DEFAULT 0
      ''');

      // Мігруємо існуючі дані
      final existingWords = await db.query('dictionary_words');
      for (final word in existingWords) {
        if (word['translation'] != null && word['translation'].toString().isNotEmpty) {
          await db.insert('word_definitions', {
            'word_id': word['id'],
            'part_of_speech': word['word_type'] ?? 'other', // Оновлено з 'unknown' на 'other'
            'definition': '',
            'translation': word['translation'],
            'example': null,
            'example_translation': null,
            'order_index': 0,
          });
        }
      }

      // Створюємо індекс
      await db.execute('''
        CREATE INDEX idx_word_id ON word_definitions(word_id)
      ''');
    }
    
    if (oldVersion < 3) {
      // Міграція з версії 2 до версії 3: оновлюємо 'unknown' на 'other'
      await db.execute('''
        UPDATE word_definitions 
        SET part_of_speech = 'other' 
        WHERE part_of_speech = 'unknown'
      ''');
    }
  }

  // Методи для роботи зі словником
  Future<int> insertWord(DictionaryWord word) async {
    final db = await database;
    
    // Додаємо слово до основної таблиці
    final wordId = await db.insert('dictionary_words', word.toMap());
    
    // Додаємо визначення
    for (final definition in word.definitions) {
      await db.insert('word_definitions', definition.copyWith(wordId: wordId).toMap());
    }
    
    return wordId;
  }

  Future<int> insertWordDefinition(WordDefinition definition) async {
    final db = await database;
    return await db.insert('word_definitions', definition.toMap());
  }

  Future<List<DictionaryWord>> getAllWords() async {
    final db = await database;
    final maps = await db.query('dictionary_words', orderBy: 'word ASC');
    
    final words = <DictionaryWord>[];
    for (final map in maps) {
      final definitions = await getWordDefinitions(map['id'] as int);
      words.add(DictionaryWord.fromMap(map, definitions: definitions));
    }
    
    return words;
  }

  Future<List<WordDefinition>> getWordDefinitions(int wordId) async {
    final db = await database;
    final maps = await db.query(
      'word_definitions',
      where: 'word_id = ?',
      whereArgs: [wordId],
      orderBy: 'part_of_speech ASC, order_index ASC',
    );
    
    return List.generate(maps.length, (i) => WordDefinition.fromMap(maps[i]));
  }

  Future<DictionaryWord?> getWordById(int id) async {
    final db = await database;
    final maps = await db.query(
      'dictionary_words',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      final definitions = await getWordDefinitions(id);
      return DictionaryWord.fromMap(maps.first, definitions: definitions);
    }
    return null;
  }

  Future<List<DictionaryWord>> searchWords(String query) async {
    final db = await database;
    
    // Шукаємо в словах та в перекладах через JOIN
    final maps = await db.rawQuery('''
      SELECT DISTINCT w.* FROM dictionary_words w
      LEFT JOIN word_definitions wd ON w.id = wd.word_id
      WHERE w.word LIKE ? OR wd.translation LIKE ? OR wd.definition LIKE ?
      ORDER BY w.word ASC
    ''', ['%$query%', '%$query%', '%$query%']);
    
    final words = <DictionaryWord>[];
    for (final map in maps) {
      final definitions = await getWordDefinitions(map['id'] as int);
      words.add(DictionaryWord.fromMap(map, definitions: definitions));
    }
    
    return words;
  }

  Future<int> updateWord(DictionaryWord word) async {
    final db = await database;
    
    // Оновлюємо основне слово
    final result = await db.update(
      'dictionary_words',
      word.copyWith(updatedAt: DateTime.now()).toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
    
    // Оновлюємо визначення (видаляємо старі та додаємо нові)
    if (word.id != null) {
      await db.delete('word_definitions', where: 'word_id = ?', whereArgs: [word.id]);
      
      for (final definition in word.definitions) {
        await db.insert('word_definitions', definition.copyWith(wordId: word.id!).toMap());
      }
    }
    
    return result;
  }

  Future<int> updateWordFavoriteStatus(int wordId, bool isFavorite) async {
    final db = await database;
    return await db.update(
      'dictionary_words',
      {
        'is_favorite': isFavorite ? 1 : 0,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [wordId],
    );
  }

  Future<int> deleteWord(int id) async {
    final db = await database;
    return await db.delete(
      'dictionary_words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Методи для роботи з закладками PDF
  Future<int> saveBookmark(String filePath, int pageNumber) async {
    final db = await database;
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.insert('pdf_bookmarks', {
      'file_path': filePath,
      'page_number': pageNumber,
      'created_at': now,
      'updated_at': now,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int?> getBookmark(String filePath) async {
    final db = await database;
    final maps = await db.query(
      'pdf_bookmarks',
      where: 'file_path = ?',
      whereArgs: [filePath],
    );

    if (maps.isNotEmpty) {
      return maps.first['page_number'] as int;
    }
    return null;
  }

  Future<int> deleteBookmark(String filePath) async {
    final db = await database;
    return await db.delete(
      'pdf_bookmarks',
      where: 'file_path = ?',
      whereArgs: [filePath],
    );
  }

  // Експорт та імпорт словника
  Future<List<Map<String, dynamic>>> exportDictionary() async {
    final words = await getAllWords();
    return words
        .map(
          (word) => {
            'word': word.word,
            'translation': word.translation,
            'word_type': word.wordType,
            'created_at': word.createdAt.toIso8601String(),
            'updated_at': word.updatedAt?.toIso8601String(),
          },
        )
        .toList();
  }

  Future<void> importDictionary(List<Map<String, dynamic>> data) async {
    final db = await database;
    final batch = db.batch();

    for (final item in data) {
      // Створюємо слово з новою структурою
      final word = DictionaryWord(
        word: item['word'],
        pronunciation: item['pronunciation'],
        isFavorite: (item['is_favorite'] ?? 0) == 1,
        createdAt: DateTime.parse(item['created_at']),
        updatedAt: item['updated_at'] != null
            ? DateTime.parse(item['updated_at'])
            : null,
      );
      
      final wordId = await db.insert('dictionary_words', word.toMap());
      
      // Якщо є стара структура, мігруємо дані
      if (item['translation'] != null && item['translation'].toString().isNotEmpty) {
        final definition = WordDefinition(
          wordId: wordId,
          partOfSpeech: item['word_type'] ?? 'unknown',
          definition: '',
          translation: item['translation'],
          order: 0,
        );
        batch.insert('word_definitions', definition.toMap());
      }
      
      // Якщо є нова структура з визначеннями
      if (item['definitions'] != null && item['definitions'] is List) {
        final definitions = item['definitions'] as List;
        for (int i = 0; i < definitions.length; i++) {
          final defData = definitions[i] as Map<String, dynamic>;
          final definition = WordDefinition(
            wordId: wordId,
            partOfSpeech: defData['part_of_speech'] ?? 'unknown',
            definition: defData['definition'] ?? '',
            translation: defData['translation'] ?? '',
            example: defData['example'],
            exampleTranslation: defData['example_translation'],
            order: i,
          );
          batch.insert('word_definitions', definition.toMap());
        }
      }
    }

    await batch.commit();
  }

  Future<void> clearDictionary() async {
    final db = await database;
    await db.delete('dictionary_words');
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
