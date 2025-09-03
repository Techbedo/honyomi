import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honyomi/generated/l10n.dart';
import 'package:honyomi/widgets/add_word_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  group('AddWordDialog', () {
    testWidgets('shows initial word and allows adding', (WidgetTester tester) async {
      String? addedWord;
      String? addedTranslation;
      String? addedType;

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('uk'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const AppLocalizationDelegate().supportedLocales,
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AddWordDialog(
                    initialWord: 'testword',
                    onWordAdded: (word, translation, type) {
                      addedWord = word;
                      addedTranslation = translation;
                      addedType = type;
                    },
                  ),
                );
              },
              child: const Text('Open Dialog'),
            ),
          ),
        ),
      );

      // Open dialog
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Initial word is shown
      expect(find.widgetWithText(TextField, 'testword'), findsOneWidget);

      // Enter translation
      await tester.enterText(find.byType(TextField).at(1), 'переклад');

  // Select word type
  await tester.tap(find.byType(DropdownButtonFormField<String>));
  await tester.pumpAndSettle();
  final BuildContext dialogContext = tester.element(find.byType(AddWordDialog));
  final nounText = S.of(dialogContext).noun;
  await tester.tap(find.text(nounText).first);
  await tester.pumpAndSettle();

      // Tap add
      await tester.tap(find.text('Додати'));
      await tester.pumpAndSettle();

      expect(addedWord, 'testword');
      expect(addedTranslation, 'переклад');
      expect(addedType, isNotNull);
    });
  });
}
