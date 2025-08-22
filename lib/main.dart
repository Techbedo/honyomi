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
                seedColor: Colors.blue,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              textTheme: GoogleFonts.robotoTextTheme(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFF1D1B20),
                titleTextStyle: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1D1B20),
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
                  color: Colors.blue[800],
                ),
                unselectedIconTheme: const IconThemeData(
                  size: 24,
                  color: Color(0xFF49454F),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: Colors.blue[800],
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
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFFE6E0E9),
                titleTextStyle: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE6E0E9),
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
              navigationRailTheme: const NavigationRailThemeData(
                backgroundColor: Color(0xFF1F1F1F),
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
              scaffoldBackgroundColor: const Color(0xFF1F1F1F),
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
  bool _isExtended = false;

  final List<Widget> _pages = [
    const LibraryPage(),
    const DictionaryPage(),
    const SettingsPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;

    if (isSmallScreen) {
      return _buildMobileLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.library_books_outlined),
            selectedIcon: const Icon(Icons.library_books),
            label: S.of(context).library,
          ),
          NavigationDestination(
            icon: const Icon(Icons.book_outlined),
            selectedIcon: const Icon(Icons.book),
            label: S.of(context).dictionary,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outlined),
            selectedIcon: const Icon(Icons.info),
            label: S.of(context).about,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final navRailTheme = Theme.of(context).navigationRailTheme;

    Widget buildTrailingItem(
        int index, IconData icon, IconData selectedIcon, String label) {
      final isSelected = _selectedIndex == index;
      final iconColor = isSelected
          ? navRailTheme.selectedIconTheme?.color
          : navRailTheme.unselectedIconTheme?.color;
      final labelStyle = isSelected
          ? navRailTheme.selectedLabelTextStyle
          : navRailTheme.unselectedLabelTextStyle;

      if (!_isExtended) {
        return IconButton(
          icon: Icon(isSelected ? selectedIcon : icon, color: iconColor),
          tooltip: label,
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      } else {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(isSelected ? selectedIcon : icon, color: iconColor),
                const SizedBox(width: 12),
                Text(label, style: labelStyle),
              ],
            ),
          ),
        );
      }
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: _isExtended,
            selectedIndex: _selectedIndex < 2 ? _selectedIndex : null,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.none,
            leading: IconButton(
              icon: Icon(_isExtended ? Icons.menu_open : Icons.menu),
              onPressed: () {
                setState(() {
                  _isExtended = !_isExtended;
                });
              },
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
              NavigationRailDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                label: Text(S.of(context).settings),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.info_outlined),
                selectedIcon: const Icon(Icons.info),
                label: Text(S.of(context).about),
              ),
            ],
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
