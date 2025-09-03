import 'word_definition.dart';

class DictionaryWord {
  final int? id;
  final String word;
  final String? pronunciation; // Фонетична транскрипція
  final bool isFavorite; // Чи додано до улюблених
  final bool isLearned; // Чи вивчено слово
  final DateTime? learnedAt; // Коли слово було вивчено
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<WordDefinition> definitions; // Список визначень для різних частин мови

  const DictionaryWord({
    this.id,
    required this.word,
    this.pronunciation,
    this.isFavorite = false,
    this.isLearned = false,
    this.learnedAt,
    required this.createdAt,
    this.updatedAt,
    this.definitions = const [],
  });

  // Compatibility getter for old translation field
  String get translation {
    if (definitions.isEmpty) return '';
    return definitions.first.translation;
  }

  // Compatibility getter for old wordType field
  String? get wordType {
    if (definitions.isEmpty) return null;
    return definitions.first.partOfSpeech;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'pronunciation': pronunciation,
      'is_favorite': isFavorite ? 1 : 0,
      'is_learned': isLearned ? 1 : 0,
      'learned_at': learnedAt?.millisecondsSinceEpoch,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory DictionaryWord.fromMap(Map<String, dynamic> map, {List<WordDefinition>? definitions}) {
    return DictionaryWord(
      id: map['id'],
      word: map['word'],
      pronunciation: map['pronunciation'],
      isFavorite: (map['is_favorite'] ?? 0) == 1,
      isLearned: (map['is_learned'] ?? 0) == 1,
      learnedAt: map['learned_at'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['learned_at'])
          : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      definitions: definitions ?? [],
    );
  }

  // Для зворотної сумісності зі старою структурою
  factory DictionaryWord.fromMapLegacy(Map<String, dynamic> map) {
    final definitions = <WordDefinition>[];
    if (map['translation'] != null && map['translation'].toString().isNotEmpty) {
      String partOfSpeech = map['word_type'] ?? 'other';
      // Конвертуємо старе значення 'unknown' в 'other'
      if (partOfSpeech == 'unknown') {
        partOfSpeech = 'other';
      }
      
      definitions.add(WordDefinition(
        wordId: map['id'] ?? 0,
        partOfSpeech: partOfSpeech,
        definition: '',
        translation: map['translation'],
        order: 0,
      ));
    }

    return DictionaryWord(
      id: map['id'],
      word: map['word'],
      pronunciation: map['pronunciation'],
      isFavorite: (map['is_favorite'] ?? 0) == 1,
      isLearned: (map['is_learned'] ?? 0) == 1,
      learnedAt: map['learned_at'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['learned_at'])
          : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      definitions: definitions,
    );
  }

  DictionaryWord copyWith({
    int? id,
    String? word,
    String? pronunciation,
    bool? isFavorite,
    bool? isLearned,
    DateTime? learnedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WordDefinition>? definitions,
  }) {
    return DictionaryWord(
      id: id ?? this.id,
      word: word ?? this.word,
      pronunciation: pronunciation ?? this.pronunciation,
      isFavorite: isFavorite ?? this.isFavorite,
      isLearned: isLearned ?? this.isLearned,
      learnedAt: learnedAt ?? this.learnedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      definitions: definitions ?? this.definitions,
    );
  }

  @override
  String toString() {
    return 'DictionaryWord{id: $id, word: $word, pronunciation: $pronunciation, isFavorite: $isFavorite, isLearned: $isLearned, learnedAt: $learnedAt, definitions: ${definitions.length}, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
