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

class _MainNavigationViewState extends State<MainNavigationView>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isExtended = false;
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  final List<Widget> _pages = [
    const LibraryPage(),
    const DictionaryPage(),
    const SettingsPage(),
    const AboutPage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 256.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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

      return AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          final isExtended = _widthAnimation.value > 120;
          
          return Container(
            width: isExtended ? _widthAnimation.value - 24 : 72,
            height: 56, // Фіксована висота для всіх станів
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Material(
              color: isSelected 
                  ? Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        isSelected ? selectedIcon : icon, 
                        color: iconColor,
                        size: 24, // Фіксований розмір іконки
                      ),
                      if (isExtended && _widthAnimation.value > 140) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: Opacity(
                            opacity: ((_widthAnimation.value - 140) / 116).clamp(0.0, 1.0),
                            child: Text(
                              label, 
                              style: labelStyle,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: navRailTheme.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Кнопка меню (завжди зліва)
                    Container(
                      width: 72,
                      height: 56, // Така ж висота як у інших елементів
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(28),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap: () {
                            setState(() {
                              _isExtended = !_isExtended;
                              if (_isExtended) {
                                _animationController.forward();
                              } else {
                                _animationController.reverse();
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                _isExtended ? Icons.menu_open : Icons.menu,
                                key: ValueKey(_isExtended),
                                size: 24, // Фіксований розмір іконки
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Основні розділи
                    buildTrailingItem(
                      0,
                      Icons.library_books_outlined,
                      Icons.library_books,
                      S.of(context).library,
                    ),
                    buildTrailingItem(
                      1,
                      Icons.book_outlined,
                      Icons.book,
                      S.of(context).dictionary,
                    ),
                    // Spacer для розташування елементів внизу
                    const Spacer(),
                    // Нижні елементи (Налаштування та Про програму)
                    buildTrailingItem(
                      2,
                      Icons.settings_outlined,
                      Icons.settings,
                      S.of(context).settings,
                    ),
                    buildTrailingItem(
                      3,
                      Icons.info_outlined,
                      Icons.info,
                      S.of(context).about,
                    ),
                    const SizedBox(height: 16), // Відступ знизу
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
