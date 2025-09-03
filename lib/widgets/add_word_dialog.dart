import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';

class AddWordDialog extends StatefulWidget {
  final String? initialWord;
  final void Function(String word, String translation, String? wordType)? onWordAdded;

  const AddWordDialog({super.key, this.initialWord, this.onWordAdded});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  late TextEditingController _wordController;
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
  void initState() {
    super.initState();
    _wordController = TextEditingController(text: widget.initialWord ?? '');
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            if (_wordController.text.isNotEmpty && _translationController.text.isNotEmpty) {
              widget.onWordAdded?.call(
                _wordController.text.trim(),
                _translationController.text.trim(),
                _selectedWordType,
              );
              Navigator.pop(context);
            }
          },
          child: Text(S.of(context).add),
        ),
      ],
    );
  }
}
