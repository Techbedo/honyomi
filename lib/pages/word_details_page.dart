import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';
import '../models/dictionary_word.dart';
import '../models/word_definition.dart';
import '../providers/app_state.dart';

class WordDetailsPage extends StatefulWidget {
  final DictionaryWord word;

  const WordDetailsPage({super.key, required this.word});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  late TextEditingController _wordController;
  late TextEditingController _translationController;
  String? _selectedWordType;
  bool _isEditing = false;

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
  void initState() {
    super.initState();
    _wordController = TextEditingController(text: widget.word.word);
    _translationController = TextEditingController(
      text: widget.word.translation,
    );
    _selectedWordType = widget.word.wordType;
  }

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

  Future<void> _saveChanges() async {
    if (_wordController.text.trim().isEmpty ||
        _translationController.text.trim().isEmpty) {
      return;
    }

    final definition = WordDefinition(
      wordId: widget.word.id ?? 0,
      partOfSpeech: _selectedWordType ?? 'unknown',
      definition: '',
      translation: _translationController.text.trim(),
      order: 0,
    );

    final updatedWord = widget.word.copyWith(
      word: _wordController.text.trim(),
      updatedAt: DateTime.now(),
      definitions: [definition],
    );

    final appState = Provider.of<AppState>(context, listen: false);
    await appState.updateDictionaryWord(updatedWord);

    setState(() {
      _isEditing = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Word updated successfully'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd(
      Localizations.localeOf(context).languageCode,
    );
    final timeFormat = DateFormat.Hm(
      Localizations.localeOf(context).languageCode,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).wordDetails),
        actions: [
          if (_isEditing)
            IconButton(
              onPressed: _saveChanges,
              icon: const Icon(Icons.save),
              tooltip: 'Save',
            )
          else
            IconButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
              icon: const Icon(Icons.edit),
              tooltip: S.of(context).edit,
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildInfoCard(
            context,
            title: 'Word Information',
            children: [
              if (_isEditing) ...[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _wordController,
                        decoration: InputDecoration(
                          labelText: S.of(context).word,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _translationController,
                        decoration: InputDecoration(
                          labelText: S.of(context).translation,
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
                ),
              ] else ...[
                ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      widget.word.word[0].toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    _wordController.text,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    _translationController.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (_selectedWordType != null)
                  ListTile(
                    leading: const Icon(Icons.category_outlined),
                    title: Text(S.of(context).wordType),
                    subtitle: Text(_getWordTypeLabel(_selectedWordType!)),
                  ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            context,
            title: 'Timestamps',
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: Text(S.of(context).createdAt),
                subtitle: Text(
                  '${dateFormat.format(widget.word.createdAt)} ${timeFormat.format(widget.word.createdAt)}',
                ),
              ),
              if (widget.word.updatedAt != null)
                ListTile(
                  leading: const Icon(Icons.update_outlined),
                  title: Text(S.of(context).updatedAt),
                  subtitle: Text(
                    '${dateFormat.format(widget.word.updatedAt!)} ${timeFormat.format(widget.word.updatedAt!)}',
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
