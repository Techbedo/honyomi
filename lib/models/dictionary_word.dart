import 'word_definition.dart';

class DictionaryWord {
  final int? id;
  final String word;
  final String? pronunciation; // Фонетична транскрипція
  final bool isFavorite; // Чи додано до улюблених
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<WordDefinition> definitions; // Список визначень для різних частин мови

  const DictionaryWord({
    this.id,
    required this.word,
    this.pronunciation,
    this.isFavorite = false,
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
      definitions.add(WordDefinition(
        wordId: map['id'] ?? 0,
        partOfSpeech: map['word_type'] ?? 'unknown',
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
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WordDefinition>? definitions,
  }) {
    return DictionaryWord(
      id: id ?? this.id,
      word: word ?? this.word,
      pronunciation: pronunciation ?? this.pronunciation,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      definitions: definitions ?? this.definitions,
    );
  }

  @override
  String toString() {
    return 'DictionaryWord{id: $id, word: $word, pronunciation: $pronunciation, isFavorite: $isFavorite, definitions: ${definitions.length}, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
