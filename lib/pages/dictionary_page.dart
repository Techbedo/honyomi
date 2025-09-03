import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';
import '../services/file_export_service.dart';
import '../widgets/add_word_dialog.dart';
import 'word_detail_page.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _showAwesomeSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  final List<String> _wordTypes = [
    'noun',
    'verb',
    'adjective',
    'adverb',
    'preposition',
    'conjunction',
    'interjection',
    'other',
  ];

  @override
  void dispose() {
    _wordController.dispose();
    _translationController.dispose();
  _searchController.dispose();
    super.dispose();
  }

  String _getWordTypeLabel(String wordType) {
    switch (wordType) {
      case 'noun':
        return S.of(context).noun;
      case 'verb':
        return S.of(context).verb;
      case 'adjective':
        return S.of(context).adjective;
      case 'adverb':
        return S.of(context).adverb;
      case 'preposition':
        return S.of(context).preposition;
      case 'conjunction':
        return S.of(context).conjunction;
      case 'interjection':
        return S.of(context).interjection;
      case 'other':
        return S.of(context).other;
      default:
        return wordType;
    }
  }

  void _showAddWordDialog() {
    showDialog(
      context: context,
      builder: (context) => AddWordDialog(
        onWordAdded: (word, translation, wordType) {
          final appState = Provider.of<AppState>(context, listen: false);
          appState.addDictionaryWord(word, translation, wordType: wordType);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: S.of(context).wordAdded,
                  message: S.of(context).wordAddedMessage(word, translation),
                  contentType: ContentType.success,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          });
        },
      ),
    );
  }

  Future<void> _exportDictionary() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      final data = await appState.exportDictionary();

      if (data.isEmpty) {
        if (mounted) {
          _showAwesomeSnackBar(
            S.of(context).dictionaryEmpty,
            S.of(context).addFirstWord,
            ContentType.warning,
          );
        }
        return;
      }

      // Створюємо структуру даних для експорту
      final exportData = {
        'version': '1.0',
        'exported_at': DateTime.now().toIso8601String(),
        'words_count': data.length,
        'words': data,
      };

      final fileName = 'honyomi_dictionary_${DateTime.now().millisecondsSinceEpoch}.json';
      
      // Використовуємо новий сервіс файлів
      await FileExportService.exportToFile(exportData, fileName);

      if (mounted) {
        _showAwesomeSnackBar(
          S.of(context).exportSuccessful,
          FileExportService.isWeb 
            ? S.of(context).dictionaryExportedWeb
            : S.of(context).dictionaryExportedDesktop,
          ContentType.success,
        );
      }
    } catch (e) {
      if (mounted) {
        _showAwesomeSnackBar(
          S.of(context).error,
          S.of(context).exportFailed('$e'),
          ContentType.failure,
        );
      }
    }
  }

  Future<void> _importDictionary() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      
      // Використовуємо новий сервіс файлів
      final importedData = await FileExportService.importFromFile();
      
      if (importedData != null) {
        List<Map<String, dynamic>> wordsData;
        
        // Перевіряємо формат даних
        if (importedData.containsKey('words') && importedData.containsKey('version')) {
          // Новий формат з версією
          wordsData = (importedData['words'] as List).cast<Map<String, dynamic>>();
        } else {
          // Старий формат - весь файл є масивом слів
          throw Exception('Invalid file format: expected object with "words" property');
        }

        await appState.importDictionary(wordsData);

        if (mounted) {
          _showAwesomeSnackBar(
            S.of(context).importSuccessful,
            S.of(context).dictionaryImportedSuccess(wordsData.length),
            ContentType.success,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        _showAwesomeSnackBar(
          S.of(context).error,
          S.of(context).importFailed('$e'),
          ContentType.failure,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).dictionary),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'export':
                        _exportDictionary();
                        break;
                      case 'import':
                        _importDictionary();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'export',
                      child: Row(
                        children: [
                          const Icon(Icons.upload),
                          const SizedBox(width: 8),
                          Text(S.of(context).exportDictionary),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'import',
                      child: Row(
                        children: [
                          const Icon(Icons.download),
                          const SizedBox(width: 8),
                          Text(S.of(context).importDictionary),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: S.of(context).allWords),
                  Tab(text: S.of(context).newWords),
                  Tab(text: S.of(context).learnedWords),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).savedWords,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: S.of(context).searchWords,
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value.trim();
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildWordList(appState.dictionaryWords), // All
                            _buildWordList(appState.dictionaryWords.where((w) => !w.isLearned).toList()), // New
                            _buildWordList(appState.dictionaryWords.where((w) => w.isLearned).toList()), // Learned
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: _showAddWordDialog,
              label: Text(S.of(context).addWord),
              icon: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWordList(List<dynamic> words) {
    // Apply search filter
    final filtered = _searchQuery.isEmpty
        ? words
        : words.where((word) {
            final w = word.word.toLowerCase();
            final t = (word.translation ?? '').toLowerCase();
            final q = _searchQuery.toLowerCase();
            return w.contains(q) || t.contains(q);
          }).toList();

    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.menu_book,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).emptyDictionary,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).addFirstWord,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final word = filtered[index];
        final menuKey = GlobalKey();
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              word.word[0].toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            word.word,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (word.translation != null)
                Text(word.translation),
              if (word.wordType != null)
                Text(
                  _getWordTypeLabel(word.wordType!),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordDetailPage(word: word),
              ),
            );
          },
          trailing: IconButton(
            key: menuKey,
            icon: const Icon(Icons.more_vert),
            onPressed: () async {
              final buttonContext = menuKey.currentContext;
              if (buttonContext == null) return;
              final RenderBox button = buttonContext.findRenderObject() as RenderBox;
              final Offset offset = button.localToGlobal(Offset.zero);
              final selected = await showMenu<String>(
                context: context,
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy + button.size.height,
                  offset.dx + button.size.width,
                  offset.dy,
                ),
                items: [
                  PopupMenuItem(
                    value: 'details',
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline),
                        const SizedBox(width: 8),
                        Text(S.of(context).wordDetails),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(Icons.delete),
                        const SizedBox(width: 8),
                        Text(S.of(context).delete),
                      ],
                    ),
                  ),
                ],
              );
              if (selected == 'details') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordDetailPage(word: word),
                  ),
                );
              } else if (selected == 'delete') {
                final appState = Provider.of<AppState>(context, listen: false);
                appState.removeDictionaryWord(word.id!);
              }
            },
          ),
        );
      },
    );
  }
}
