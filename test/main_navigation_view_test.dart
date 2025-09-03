import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honyomi/main.dart';
import 'package:honyomi/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:honyomi/providers/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';

void main() {
    group('MainNavigationView', () {
      setUp(() {
        debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      });
      tearDown(() {
        debugDefaultTargetPlatformOverride = null;
      });

      testWidgets('renders navigation rail and switches pages', (WidgetTester tester) async {
        // Встановлюємо ширину поверхні для desktop-інтерфейсу
        await tester.binding.setSurfaceSize(const Size(1000, 800));
        await tester.pumpWidget(
          ChangeNotifierProvider<AppState>(
            create: (_) => AppState(),
            child: MaterialApp(
              locale: const Locale('uk'),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const AppLocalizationDelegate().supportedLocales,
              home: const MainNavigationView(),
            ),
          ),
        );

        // Перевіряємо наявність навігаційної панелі
        expect(find.byType(NavigationRail), findsOneWidget);
        // Перевіряємо, що є сторінка словника
        expect(find.text(S.current.dictionary), findsOneWidget);
        // Перехід на сторінку налаштувань
        await tester.tap(find.byIcon(Icons.settings));
        await tester.pumpAndSettle();
        expect(find.text(S.current.settings), findsOneWidget);
      });
    });
}
