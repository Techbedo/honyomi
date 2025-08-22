import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'generated/l10n.dart';
import 'providers/app_state.dart';
import 'pages/library_page.dart';
import 'pages/dictionary_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart';
import 'pages/pdf_viewer_page.dart';

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
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF6750A4), // Material 3 Purple
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFF1D1B20),
                titleTextStyle: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1D1B20),
                ),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFFF7F2FA),
                surfaceTintColor: Colors.transparent,
              ),
              navigationRailTheme: const NavigationRailThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  size: 24,
                  color: Color(0xFF6750A4),
                ),
                unselectedIconTheme: IconThemeData(
                  size: 24,
                  color: Color(0xFF49454F),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: Color(0xFF6750A4),
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelTextStyle: TextStyle(
                  color: Color(0xFF49454F),
                  fontWeight: FontWeight.w400,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              dividerColor: const Color(0xFFE6E0E9),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFD0BCFF), // Material 3 Purple Dark
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFFE6E0E9),
                titleTextStyle: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE6E0E9),
                ),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFF322F35),
                surfaceTintColor: Colors.transparent,
              ),
              navigationRailTheme: const NavigationRailThemeData(
                backgroundColor: Color(0xFF1D1B20),
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  size: 24,
                  color: Color(0xFFD0BCFF),
                ),
                unselectedIconTheme: IconThemeData(
                  size: 24,
                  color: Color(0xFFCAC4D0),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: Color(0xFFD0BCFF),
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelTextStyle: TextStyle(
                  color: Color(0xFFCAC4D0),
                  fontWeight: FontWeight.w400,
                ),
              ),
              scaffoldBackgroundColor: const Color(0xFF1D1B20),
              dividerColor: const Color(0xFF49454F),
            ),
            themeMode: appState.themeMode,
            locale: appState.locale,
            home: const MainNavigationView(),
            routes: {
              '/pdf_viewer': (context) {
                final filePath = ModalRoute.of(context)!.settings.arguments as String;
                return PdfViewerPage(filePath: filePath);
              },
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

  final List<Widget> _pages = [
    const LibraryPage(),
    const DictionaryPage(),
    const SettingsPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex >= 2 ? null : _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  // Quick action - open file picker
                  // TODO: Implement quick file picker
                },
                child: const Icon(Icons.add),
              ),
            ),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 32,
                        height: 1,
                        color: Theme.of(context).colorScheme.outline,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        customBorder: const CircleBorder(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == 2
                                ? Theme.of(context).colorScheme.secondaryContainer
                                : null,
                          ),
                          child: Icon(
                            _selectedIndex == 2 ? Icons.settings : Icons.settings_outlined,
                            color: _selectedIndex == 2
                                ? Theme.of(context).colorScheme.onSecondaryContainer
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        customBorder: const CircleBorder(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == 3
                                ? Theme.of(context).colorScheme.secondaryContainer
                                : null,
                          ),
                          child: Icon(
                            _selectedIndex == 3 ? Icons.info : Icons.info_outlined,
                            color: _selectedIndex == 3
                                ? Theme.of(context).colorScheme.onSecondaryContainer
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.library_books_outlined),
                selectedIcon: const Icon(Icons.library_books),
                label: Text(S.of(context).library),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.book_outlined),
                selectedIcon: const Icon(Icons.book),
                label: Text(S.of(context).dictionary),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
