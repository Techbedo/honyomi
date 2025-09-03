import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../models/dictionary_word.dart';
import '../models/word_definition.dart';
import '../providers/app_state.dart';

class AddEditWordPage extends StatefulWidget {
  final DictionaryWord? word; // null для додавання нового слова

  const AddEditWordPage({super.key, this.word});

  @override
  State<AddEditWordPage> createState() => _AddEditWordPageState();
}

class _AddEditWordPageState extends State<AddEditWordPage> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _pronunciationController = TextEditingController();
  
  List<WordDefinitionForm> _definitions = [];
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    
    if (widget.word != null) {
      // Редагування існуючого слова
      _wordController.text = widget.word!.word;
      _pronunciationController.text = widget.word!.pronunciation ?? '';
      _isFavorite = widget.word!.isFavorite;
      
      if (widget.word!.definitions.isNotEmpty) {
        _definitions = widget.word!.definitions.map((def) => 
          WordDefinitionForm.fromDefinition(def)
        ).toList();
      } else {
        _addDefinition();
      }
    } else {
      // Додавання нового слова
      _addDefinition();
    }
  }

  @override
  void dispose() {
    _wordController.dispose();
    _pronunciationController.dispose();
    for (final def in _definitions) {
      def.dispose();
    }
    super.dispose();
  }

  void _addDefinition() {
    setState(() {
      _definitions.add(WordDefinitionForm());
    });
  }

  void _removeDefinition(int index) {
    setState(() {
      _definitions[index].dispose();
      _definitions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word == null ? S.of(context).addWord : S.of(context).editWord),
        backgroundColor: colorScheme.surface,
        actions: [
          TextButton(
            onPressed: _saveWord,
            child: Text(
              S.of(context).save,
              style: TextStyle(color: colorScheme.primary),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Основна інформація про слово
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).wordInformation,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Поле для введення слова
                    TextFormField(
                      controller: _wordController,
                      decoration: InputDecoration(
                        labelText: S.of(context).word,
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.text_fields),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return S.of(context).pleaseEnterWord;
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Поле для фонетичної транскрипції
                    TextFormField(
                      controller: _pronunciationController,
                      decoration: InputDecoration(
                        labelText: S.of(context).pronunciation,
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.volume_up),
                        hintText: 'həˈloʊ',
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Перемикач "улюблене"
                    Row(
                      children: [
                        Icon(
                          _isFavorite ? Icons.star : Icons.star_border,
                          color: _isFavorite ? Colors.amber : null,
                        ),
                        const SizedBox(width: 8),
                        Text(S.of(context).addToFavorites),
                        const Spacer(),
                        Switch(
                          value: _isFavorite,
                          onChanged: (value) {
                            setState(() {
                              _isFavorite = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Визначення слова
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).wordDefinitions,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: _addDefinition,
                          icon: const Icon(Icons.add),
                          label: Text(S.of(context).addDefinition),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Список визначень
                    ..._definitions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final definition = entry.value;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Заголовок визначення з кнопкою видалення
                              Row(
                                children: [
                                  Text(
                                    '${S.of(context).definition} ${index + 1}',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (_definitions.length > 1)
                                    IconButton(
                                      onPressed: () => _removeDefinition(index),
                                      icon: const Icon(Icons.delete_outline),
                                      tooltip: S.of(context).deleteDefinition,
                                    ),
                                ],
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Частина мови
                              DropdownButtonFormField<String>(
                                value: definition.partOfSpeech,
                                decoration: InputDecoration(
                                  labelText: S.of(context).partOfSpeech,
                                  border: const OutlineInputBorder(),
                                ),
                                items: _getPartOfSpeechItems(context),
                                onChanged: (value) {
                                  setState(() {
                                    definition.partOfSpeech = value ?? 'noun';
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).pleaseSelectPartOfSpeech;
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Переклад
                              TextFormField(
                                controller: definition.translationController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).translation,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.translate),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return S.of(context).pleaseEnterTranslation;
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Визначення (опціонально)
                              TextFormField(
                                controller: definition.definitionController,
                                decoration: InputDecoration(
                                  labelText: '${S.of(context).definition} (${S.of(context).optional})',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.description),
                                  hintText: S.of(context).enterDefinitionInEnglish,
                                ),
                                maxLines: 2,
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Приклад використання
                              TextFormField(
                                controller: definition.exampleController,
                                decoration: InputDecoration(
                                  labelText: '${S.of(context).example} (${S.of(context).optional})',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.format_quote),
                                  hintText: S.of(context).enterExampleSentence,
                                ),
                                maxLines: 2,
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Переклад прикладу
                              TextFormField(
                                controller: definition.exampleTranslationController,
                                decoration: InputDecoration(
                                  labelText: '${S.of(context).exampleTranslation} (${S.of(context).optional})',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.translate),
                                  hintText: S.of(context).enterExampleTranslation,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getPartOfSpeechItems(BuildContext context) {
    return [
      DropdownMenuItem(value: 'noun', child: Text(S.of(context).partOfSpeechNoun)),
      DropdownMenuItem(value: 'verb', child: Text(S.of(context).partOfSpeechVerb)),
      DropdownMenuItem(value: 'adjective', child: Text(S.of(context).partOfSpeechAdjective)),
      DropdownMenuItem(value: 'adverb', child: Text(S.of(context).partOfSpeechAdverb)),
      DropdownMenuItem(value: 'preposition', child: Text(S.of(context).partOfSpeechPreposition)),
      DropdownMenuItem(value: 'conjunction', child: Text(S.of(context).partOfSpeechConjunction)),
      DropdownMenuItem(value: 'interjection', child: Text(S.of(context).partOfSpeechInterjection)),
      DropdownMenuItem(value: 'pronoun', child: Text(S.of(context).partOfSpeechPronoun)),
    ];
  }

  Future<void> _saveWord() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final word = _wordController.text.trim();
    final pronunciation = _pronunciationController.text.trim();
    
    // Створюємо список визначень
    final definitions = <WordDefinition>[];
    for (int i = 0; i < _definitions.length; i++) {
      final def = _definitions[i];
      final translation = def.translationController.text.trim();
      
      if (translation.isNotEmpty) {
        definitions.add(WordDefinition(
          wordId: widget.word?.id ?? 0,
          partOfSpeech: def.partOfSpeech,
          definition: def.definitionController.text.trim(),
          translation: translation,
          example: def.exampleController.text.trim().isNotEmpty 
              ? def.exampleController.text.trim() : null,
          exampleTranslation: def.exampleTranslationController.text.trim().isNotEmpty 
              ? def.exampleTranslationController.text.trim() : null,
          order: i,
        ));
      }
    }

    if (definitions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseAddAtLeastOneDefinition),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final appState = Provider.of<AppState>(context, listen: false);
    
    try {
      if (widget.word == null) {
        // Додавання нового слова
        final newWord = DictionaryWord(
          word: word,
          pronunciation: pronunciation.isNotEmpty ? pronunciation : null,
          isFavorite: _isFavorite,
          createdAt: DateTime.now(),
          definitions: definitions,
        );
        
        await appState.addDictionaryWordWithDefinitions(newWord);
      } else {
        // Редагування існуючого слова
        final updatedWord = widget.word!.copyWith(
          word: word,
          pronunciation: pronunciation.isNotEmpty ? pronunciation : null,
          isFavorite: _isFavorite,
          updatedAt: DateTime.now(),
          definitions: definitions,
        );
        
        await appState.updateDictionaryWord(updatedWord);
      }

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${S.of(context).errorSavingWord}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}

class WordDefinitionForm {
  String partOfSpeech;
  final TextEditingController translationController;
  final TextEditingController definitionController;
  final TextEditingController exampleController;
  final TextEditingController exampleTranslationController;

  WordDefinitionForm({
    this.partOfSpeech = 'noun',
    String? translation,
    String? definition,
    String? example,
    String? exampleTranslation,
  })  : translationController = TextEditingController(text: translation),
        definitionController = TextEditingController(text: definition),
        exampleController = TextEditingController(text: example),
        exampleTranslationController = TextEditingController(text: exampleTranslation);

  WordDefinitionForm.fromDefinition(WordDefinition definition)
      : partOfSpeech = definition.partOfSpeech,
        translationController = TextEditingController(text: definition.translation),
        definitionController = TextEditingController(text: definition.definition),
        exampleController = TextEditingController(text: definition.example),
        exampleTranslationController = TextEditingController(text: definition.exampleTranslation);

  void dispose() {
    translationController.dispose();
    definitionController.dispose();
    exampleController.dispose();
    exampleTranslationController.dispose();
  }
}
