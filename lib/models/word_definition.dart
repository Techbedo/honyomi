class WordDefinition {
  final int? id;
  final int wordId;
  final String partOfSpeech; // noun, verb, adjective, etc.
  final String definition; // English definition
  final String translation; // Ukrainian translation
  final String? example; // Example usage
  final String? exampleTranslation; // Ukrainian translation of example
  final int order; // Order within the same part of speech

  const WordDefinition({
    this.id,
    required this.wordId,
    required this.partOfSpeech,
    required this.definition,
    required this.translation,
    this.example,
    this.exampleTranslation,
    this.order = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word_id': wordId,
      'part_of_speech': partOfSpeech,
      'definition': definition,
      'translation': translation,
      'example': example,
      'example_translation': exampleTranslation,
      'order_index': order,
    };
  }

  factory WordDefinition.fromMap(Map<String, dynamic> map) {
    return WordDefinition(
      id: map['id'],
      wordId: map['word_id'],
      partOfSpeech: map['part_of_speech'],
      definition: map['definition'],
      translation: map['translation'],
      example: map['example'],
      exampleTranslation: map['example_translation'],
      order: map['order_index'] ?? 0,
    );
  }

  WordDefinition copyWith({
    int? id,
    int? wordId,
    String? partOfSpeech,
    String? definition,
    String? translation,
    String? example,
    String? exampleTranslation,
    int? order,
  }) {
    return WordDefinition(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definition: definition ?? this.definition,
      translation: translation ?? this.translation,
      example: example ?? this.example,
      exampleTranslation: exampleTranslation ?? this.exampleTranslation,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'WordDefinition{id: $id, wordId: $wordId, partOfSpeech: $partOfSpeech, definition: $definition, translation: $translation}';
  }
}
