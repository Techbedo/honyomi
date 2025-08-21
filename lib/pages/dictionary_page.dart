import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  int? _selectedIndex;
  
  void _showAddWordDialog() {
    final wordController = TextEditingController();
    final translationController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Add Word'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextBox(
              controller: wordController,
              placeholder: 'Word',
            ),
            const SizedBox(height: 16),
            TextBox(
              controller: translationController,
              placeholder: 'Translation',
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Add'),
            onPressed: () {
              if (wordController.text.isNotEmpty && translationController.text.isNotEmpty) {
                final appState = context.read<AppState>();
                appState.addToDictionary(wordController.text, translationController.text);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _showEditWordDialog(int index) {
    final appState = context.read<AppState>();
    final word = appState.dictionaryWords[index];
    final wordController = TextEditingController(text: word['word']);
    final translationController = TextEditingController(text: word['translation']);
    
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Edit Word'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextBox(
              controller: wordController,
              placeholder: 'Word',
            ),
            const SizedBox(height: 16),
            TextBox(
              controller: translationController,
              placeholder: 'Translation',
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Save'),
            onPressed: () {
              if (wordController.text.isNotEmpty && translationController.text.isNotEmpty) {
                appState.updateDictionaryWord(index, wordController.text, translationController.text);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(String text) {
    // TODO: Implement clipboard functionality
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Copied'),
        content: Text('Copied "$text" to clipboard'),
        actions: [
          Button(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: const Text('Dictionary'),
        commandBar: CommandBar(
          primaryItems: [
            CommandBarButton(
              icon: const Icon(FluentIcons.add),
              label: const Text('Add Word'),
              onPressed: _showAddWordDialog,
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.copy),
              label: const Text('Copy'),
              onPressed: _selectedIndex != null ? () {
                final appState = context.read<AppState>();
                final word = appState.dictionaryWords[_selectedIndex!];
                _copyToClipboard('${word['word']} - ${word['translation']}');
              } : null,
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.delete),
              label: const Text('Delete'),
              onPressed: _selectedIndex != null ? () {
                final appState = context.read<AppState>();
                appState.removeDictionaryWord(_selectedIndex!);
                setState(() {
                  _selectedIndex = null;
                });
              } : null,
            ),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            if (appState.dictionaryWords.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.dictionary,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No words in dictionary',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add words from PDF viewer or use the Add Word button',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: appState.dictionaryWords.length,
              itemBuilder: (context, index) {
                final word = appState.dictionaryWords[index];
                final isSelected = _selectedIndex == index;
                
                return Card(
                  backgroundColor: isSelected 
                    ? FluentTheme.of(context).accentColor.withOpacity(0.1)
                    : null,
                  child: ListTile(
                    title: Text(
                      word['word'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(word['translation'] ?? ''),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = isSelected ? null : index;
                      });
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(FluentIcons.edit),
                          onPressed: () => _showEditWordDialog(index),
                        ),
                        IconButton(
                          icon: const Icon(FluentIcons.copy),
                          onPressed: () => _copyToClipboard('${word['word']} - ${word['translation']}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
