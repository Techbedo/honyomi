import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../models/dictionary_word.dart';
import '../models/word_definition.dart';
import '../generated/l10n.dart';
import 'add_edit_word_page.dart';

class WordDetailPage extends StatefulWidget {
  final DictionaryWord word;
  final Function(DictionaryWord)? onWordUpdated;

  const WordDetailPage({
    super.key,
    required this.word,
    this.onWordUpdated,
  });

  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late DictionaryWord _word;

  @override
  void initState() {
    super.initState();
    _word = widget.word;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_word.word),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _word.isLearned ? Icons.check_circle : Icons.check_circle_outline,
              color: _word.isLearned ? Colors.green : null,
            ),
            onPressed: _toggleLearned,
            tooltip: _word.isLearned ? S.of(context).markAsNotLearned : S.of(context).markAsLearned,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editWord,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Заголовок слова
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _word.word,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                if (_word.pronunciation != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _word.pronunciation!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Вкладки
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: colorScheme.primary,
              unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.7),
              indicatorColor: colorScheme.primary,
              tabs: [
                Tab(text: S.of(context).wordDefinitions),
                Tab(text: S.of(context).wordTranslations),
              ],
            ),
          ),
          
          // Вміст вкладок
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDefinitionsTab(),
                _buildTranslationsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionsTab() {
    if (_word.definitions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).noDefinitionsAvailable,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    // Групуємо визначення за частинами мови
    final groupedDefinitions = <String, List<WordDefinition>>{};
    for (final definition in _word.definitions) {
      if (!groupedDefinitions.containsKey(definition.partOfSpeech)) {
        groupedDefinitions[definition.partOfSpeech] = [];
      }
      groupedDefinitions[definition.partOfSpeech]!.add(definition);
    }

    // Сортуємо визначення в межах кожної частини мови за order
    for (final key in groupedDefinitions.keys) {
      groupedDefinitions[key]!.sort((a, b) => a.order.compareTo(b.order));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Назва слова (жирним)
          Text(
            _word.word,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          
          // Транскрипція (якщо є)
          if (_word.pronunciation != null && _word.pronunciation!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              _word.pronunciation!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Лінія-розділювач
          Container(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            margin: const EdgeInsets.only(bottom: 24),
          ),
          
          // Групи за частинами мови
          ...groupedDefinitions.entries.map((entry) {
            final partOfSpeech = entry.key;
            final definitions = entry.value;
            
            return Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Частина мови
                  Text(
                    _getPartOfSpeechLabel(partOfSpeech),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Список перекладів
                  ...definitions.asMap().entries.map((defEntry) {
                    final index = defEntry.key;
                    final definition = defEntry.value;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Номер і переклад
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                                TextSpan(
                                  text: '${index + 1}. ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: definition.translation,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Визначення (якщо є)
                          if (definition.definition.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                definition.definition,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                ),
                              ),
                            ),
                          ],
                          
                          // Приклад використання (якщо є)
                          if (definition.example != null && definition.example!.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                definition.example!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                                ),
                              ),
                            ),
                          ],
                          
                          // Переклад прикладу (якщо є)
                          if (definition.exampleTranslation != null && definition.exampleTranslation!.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                definition.exampleTranslation!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTranslationsTab() {
    // Альтернативна вкладка з фокусом на переклади (компактний вигляд)
    if (_word.definitions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.translate_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).noTranslationsAvailable,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    final groupedDefinitions = <String, List<WordDefinition>>{};
    for (final definition in _word.definitions) {
      if (!groupedDefinitions.containsKey(definition.partOfSpeech)) {
        groupedDefinitions[definition.partOfSpeech] = [];
      }
      groupedDefinitions[definition.partOfSpeech]!.add(definition);
    }

    // Сортуємо визначення в межах кожної частини мови за order
    for (final key in groupedDefinitions.keys) {
      groupedDefinitions[key]!.sort((a, b) => a.order.compareTo(b.order));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groupedDefinitions.keys.length,
      itemBuilder: (context, index) {
        final partOfSpeech = groupedDefinitions.keys.elementAt(index);
        final definitions = groupedDefinitions[partOfSpeech]!;
        
        return _buildTranslationSection(partOfSpeech, definitions);
      },
    );
  }

  Widget _buildTranslationSection(String partOfSpeech, List<WordDefinition> definitions) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getPartOfSpeechLabel(partOfSpeech),
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 12),
          
          ...definitions.asMap().entries.map((entry) {
            final index = entry.key;
            final definition = entry.value;
            
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      definition.translation,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  String _getPartOfSpeechLabel(String partOfSpeech) {
    // Переклад частин мови
    switch (partOfSpeech.toLowerCase()) {
      case 'noun':
        return S.of(context).partOfSpeechNoun;
      case 'verb':
        return S.of(context).partOfSpeechVerb;
      case 'adjective':
        return S.of(context).partOfSpeechAdjective;
      case 'adverb':
        return S.of(context).partOfSpeechAdverb;
      case 'preposition':
        return S.of(context).partOfSpeechPreposition;
      case 'conjunction':
        return S.of(context).partOfSpeechConjunction;
      case 'interjection':
        return S.of(context).partOfSpeechInterjection;
      case 'pronoun':
        return S.of(context).partOfSpeechPronoun;
      case 'other':
      case 'unknown':
        return S.of(context).other;
      default:
        return S.of(context).other;
    }
  }

  void _toggleLearned() {
    setState(() {
      _word = _word.copyWith(isLearned: !_word.isLearned, learnedAt: _word.isLearned ? null : DateTime.now());
    });
    widget.onWordUpdated?.call(_word);
    
    // Тактильний відгук
    if (_word.isLearned) {
      // Віброспрацьовування для позначення як вивчене
      Navigator.of(context).maybePop().then((_) {
        // Можна додати вібрацію пізніше
      });
    }
    
    // Показуємо повідомлення
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: _word.isLearned ? S.of(context).success : S.of(context).info,
        message: _word.isLearned ? S.of(context).wordLearned : S.of(context).wordUnlearned,
        contentType: _word.isLearned ? ContentType.success : ContentType.help,
      ),
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _editWord() async {
    final result = await Navigator.push<DictionaryWord>(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditWordPage(word: _word),
      ),
    );
    
    if (result != null) {
      setState(() {
        _word = result;
      });
      widget.onWordUpdated?.call(result);
    }
  }
}
