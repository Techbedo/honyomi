// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:honyomi/main.dart';
import 'package:honyomi/src/services/settings_service.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    final settings = SettingsService.instance;
    // Avoid async load() in test; use defaults
    await tester.pumpWidget(MyApp(settings: settings));
    await tester.pumpAndSettle();
    expect(find.byType(MyApp), findsOneWidget);
  });
}
