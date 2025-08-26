import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'providers/app_state.dart';
import 'pages/library_page.dart';
import 'pages/dictionary_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart';
import 'pages/pdf_viewer_page.dart';
import 'widgets/navigation_layout.dart';

// Custom route without animation
class NoAnimationPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  
  NoAnimationPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState()..loadSettings(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          final lightColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          );
          final darkColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          );
          
          return MaterialApp(
            title: 'Honyomi',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Color(0xFF1D1B20),
                titleTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1D1B20),
                ),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
              ),
              navigationRailTheme: NavigationRailThemeData(
                backgroundColor: const Color(0xFFF7F9FC),
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  size: 24,
                  color: lightColorScheme.primary, // Використовуємо primary колір теми
                ),
                unselectedIconTheme: const IconThemeData(
                  size: 24,
                  color: Color(0xFF49454F),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: lightColorScheme.primary, // Використовуємо primary колір теми
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelTextStyle: const TextStyle(
                  color: Color(0xFF49454F),
                  fontWeight: FontWeight.w400,
                ),
              ),
              scaffoldBackgroundColor: const Color(0xFFF7F9FC),
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Color(0xFFE6E0E9),
                titleTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE6E0E9),
                ),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFF2D2E31),
                surfaceTintColor: Colors.transparent,
              ),
              navigationRailTheme: NavigationRailThemeData(
                backgroundColor: const Color(0xFF1F1F1F),
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  size: 24,
                  color: darkColorScheme.primary, // Використовуємо primary колір теми
                ),
                unselectedIconTheme: const IconThemeData(
                  size: 24,
                  color: Color(0xFFCAC4D0),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: darkColorScheme.primary, // Використовуємо primary колір теми
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelTextStyle: const TextStyle(
                  color: Color(0xFFCAC4D0),
                  fontWeight: FontWeight.w400,
                ),
              ),
              scaffoldBackgroundColor: const Color(0xFF1F1F1F),
            ),
            themeMode: appState.themeMode,
            locale: appState.locale,
            home: const MainNavigationView(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/pdf_viewer':
                  final arguments = settings.arguments;
                  if (arguments != null) {
                    return NoAnimationPageRoute(child: PdfViewerPage(arguments: arguments));
                  }
                  return NoAnimationPageRoute(child: const MainNavigationView());
                default:
                  return NoAnimationPageRoute(child: const MainNavigationView());
              }
            },
          );
        },
      ),
    );
  }
}

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return const LibraryPage();
      case 1:
        return const DictionaryPage();
      case 2:
        return const SettingsPage();
      case 3:
        return const AboutPage();
      default:
        return const LibraryPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationLayout(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onDestinationSelected,
      child: _getCurrentPage(),
    );
  }
}
