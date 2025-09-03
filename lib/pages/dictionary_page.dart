import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';
import '../services/file_export_service.dart';
import 'word_detail_page.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();
  String? _selectedWordType;

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
    _wordController.clear();
    _translationController.clear();
    _selectedWordType = null;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(S.of(context).addWord),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _wordController,
                decoration: InputDecoration(
                  labelText: S.of(context).word,
                  hintText: S.of(context).enterWord,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _translationController,
                decoration: InputDecoration(
                  labelText: S.of(context).translation,
                  hintText: S.of(context).enterTranslation,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedWordType,
                decoration: InputDecoration(
                  labelText: S.of(context).wordType,
                  border: const OutlineInputBorder(),
                ),
                hint: Text(S.of(context).selectWordType),
                items: _wordTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(_getWordTypeLabel(type)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedWordType = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).cancel),
            ),
            FilledButton(
              onPressed: () {
                if (_wordController.text.isNotEmpty &&
                    _translationController.text.isNotEmpty) {
                  final appState = Provider.of<AppState>(
                    context,
                    listen: false,
                  );
                  appState.addDictionaryWord(
                    _wordController.text.trim(),
                    _translationController.text.trim(),
                    wordType: _selectedWordType,
                  );

                  Navigator.pop(context);

                  // Показуємо snackbar після закриття діалогу
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: S.of(context).wordAdded,
                          message: S
                              .of(context)
                              .wordAddedMessage(
                                _wordController.text.trim(),
                                _translationController.text.trim(),
                              ),
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                }
              },
              child: Text(S.of(context).add),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportDictionary() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      final data = await appState.exportDictionary();

      if (data.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Dictionary is empty'))
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(FileExportService.isWeb 
              ? 'Dictionary exported! Check your downloads folder.'
              : 'Dictionary exported to Documents folder.'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Dictionary imported successfully (${wordsData.length} words)'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Import failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
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
                    const SizedBox(height: 8),
                    Expanded(
                      child: appState.dictionaryWords.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    size: 64,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    S.of(context).emptyDictionary,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    S.of(context).addFirstWord,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: appState.dictionaryWords.length,
                              itemBuilder: (context, index) {
                                final word = appState.dictionaryWords[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Text(
                                      word.word[0].toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    word.word,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(word.translation),
                                      if (word.wordType != null)
                                        Text(
                                          _getWordTypeLabel(word.wordType!),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WordDetailPage(word: word),
                                      ),
                                    );
                                  },
                                  trailing: IconButton(
                                    icon: const Icon(Icons.more_vert),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Wrap(
                                            children: [
                                              ListTile(
                                                leading: const Icon(
                                                  Icons.info_outline,
                                                ),
                                                title: Text(
                                                  S.of(context).wordDetails,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          WordDetailPage(
                                                            word: word,
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                  Icons.delete,
                                                ),
                                                title: Text(
                                                  S.of(context).delete,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  appState.removeDictionaryWord(
                                                    word.id!,
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
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
        );
      },
    );
  }
}
