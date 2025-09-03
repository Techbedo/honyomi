# API Documentation

This document provides comprehensive API documentation for Honyomi v1.0.1, including Material 3 components, localization system, and core functionality.

## Table of Contents

1. [Core Application](#core-application)
2. [Material 3 Components](#material-3-components)
3. [Localization System](#localization-system)
4. [Navigation System](#navigation-system)
5. [Theme System](#theme-system)
6. [Utility Functions](#utility-functions)

## Core Application
### AddWordDialog Widget

Reusable dialog for adding words to the dictionary, used in both PDF viewer and Dictionary page.

```dart
class AddWordDialog extends StatefulWidget {
  final String? initialWord;
  final void Function(String word, String translation, String? wordType)? onWordAdded;
  // ...existing code...
}
```

**Features:**
- Supports all word types (noun, verb, adjective, adverb, preposition, conjunction, interjection, other)
- Used in both PDF context menu and Dictionary page
- Localized labels and validation

### Context Menu Integration

Context menu in PDF viewer and Dictionary page allows adding selected text as a word to the dictionary.

**PDF:** Right-click selected text → "Add Word"
**Dictionary:** Click "..." button → "Add Word"

### AwesomeSnackbarContent

All notifications and feedback use awesome_snackbar_content with localized texts.

### Dictionary Search & Filtering

Dictionary page supports search by word/translation and tabs for All/New/Learned words.

### SettingsPage Spacing

All settings blocks use equal vertical spacing for a harmonious UI.

### MyApp Class

Main application widget implementing Material 3 theming and localization.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honyomi',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainPage(),
    );
  }
}
```

**Properties:**

- `title`: Application title displayed in task switcher
- `theme`: Light theme configuration with Material 3
- `darkTheme`: Dark theme configuration with Material 3
- `themeMode`: System-based theme mode selection
- `localizationsDelegates`: Localization delegates including S class
- `supportedLocales`: List of supported locales (en, uk)

### MainPage Class

Main page widget implementing NavigationRail-based navigation.

```dart
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildNavigationRail(),
          Expanded(child: _getSelectedPage()),
        ],
      ),
    );
  }
}
```

**Properties:**

- `_selectedIndex`: Currently selected navigation index

**Methods:**

- `_buildNavigationRail()`: Builds Material 3 NavigationRail
- `_getSelectedPage()`: Returns currently selected page widget

## Material 3 Components

### NavigationRail Configuration

Material 3 navigation rail with proper theming and safe index handling.

```dart
NavigationRail _buildNavigationRail() {
  return NavigationRail(
    selectedIndex: _selectedIndex < 4 ? _selectedIndex : null,
    onDestinationSelected: (int index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    labelType: NavigationRailLabelType.all,
    backgroundColor: Theme.of(context).colorScheme.surface,
    indicatorColor: Theme.of(context).colorScheme.primaryContainer,
    selectedIconTheme: IconThemeData(
      color: Theme.of(context).colorScheme.primary,
    ),
    unselectedIconTheme: IconThemeData(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    ),
    selectedLabelTextStyle: GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelTextStyle: GoogleFonts.inter(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
    ),
    destinations: [
      // Destinations array
    ],
    trailing: _buildNavigationTrailing(),
  );
}
```

**Properties:**

- `selectedIndex`: Safe index handling (null if >= destinations.length)
- `labelType`: All labels visible (NavigationRailLabelType.all)
- `backgroundColor`: Surface color from Material 3 color scheme
- `indicatorColor`: Primary container color for selected state
- `selectedIconTheme`: Primary color for selected icons
- `unselectedIconTheme`: On-surface variant color for unselected icons

### NavigationRailDestination

Individual navigation destinations with Material 3 styling.

```dart
NavigationRailDestination(
  icon: Icon(Icons.library_books_outlined),
  selectedIcon: Icon(Icons.library_books),
  label: Text(S.of(context).library),
)
```

**Properties:**

- `icon`: Outlined icon for unselected state
- `selectedIcon`: Filled icon for selected state
- `label`: Localized text label using S class

### Material 3 Cards

Standardized card component with Material 3 styling.

```dart
Widget buildInfoCard(
  BuildContext context,
  String title,
  String content,
  IconData icon,
) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
```

**Parameters:**

- `context`: Build context for theme access
- `title`: Card title text
- `content`: Card content text
- `icon`: Icon to display in card header

**Returns:** Card widget with Material 3 styling

## Localization System

### S Class (Generated)

Auto-generated localization class providing type-safe string access.

```dart
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];
}
```

### Localization Keys

#### Navigation

```dart
String get library; // "Library" / "Бібліотека"
String get dictionary; // "Dictionary" / "Словник"
String get pdfViewer; // "PDF Viewer" / "PDF переглядач"
String get settings; // "Settings" / "Налаштування"
String get about; // "About" / "Про додаток"
```

#### Settings Page

```dart
String get appearance; // "Appearance" / "Зовнішній вигляд"
String get language; // "Language" / "Мова"
String get theme; // "Theme" / "Тема"
String get lightTheme; // "Light" / "Світла"
String get darkTheme; // "Dark" / "Темна"
String get systemTheme; // "System" / "Системна"
```

#### About Page

```dart
String get version; // "Version" / "Версія"
String get buildNumber; // "Build Number" / "Номер збірки"
String get developer; // "Developer" / "Розробник"
String get license; // "License" / "Ліцензія"
String get sourceCode; // "Source Code" / "Вихідний код"
```

### Usage Examples

```dart
// Basic usage
Text(S.of(context).library)

// In app bar
AppBar(title: Text(S.of(context).settings))

// In navigation
NavigationRailDestination(
  icon: Icon(Icons.settings_outlined),
  selectedIcon: Icon(Icons.settings),
  label: Text(S.of(context).settings),
)

// In buttons
FilledButton(
  onPressed: () {},
  child: Text(S.of(context).save),
)
```

## Navigation System

### Page Management

```dart
Widget _getSelectedPage() {
  switch (_selectedIndex) {
    case 0:
      return const LibraryPage();
    case 1:
      return const DictionaryPage();
    case 2:
      return const PdfViewerPage();
    case 3:
      return const SettingsPage();
    case 4:
      return const AboutPage();
    default:
      return const LibraryPage();
  }
}
```

### Navigation State

```dart
void _onDestinationSelected(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
```

**Parameters:**

- `index`: Zero-based destination index

**Behavior:**

- Updates `_selectedIndex` state
- Triggers widget rebuild
- Changes visible page content

### Safe Navigation

```dart
NavigationRail(
  selectedIndex: _selectedIndex < destinations.length ? _selectedIndex : null,
  // ...
)
```

**Purpose:** Prevents index out of bounds errors by setting selectedIndex to null when index exceeds destinations length.

## Theme System

### AppTheme Class

Centralized theme management for Material 3.

```dart
class AppTheme {
  static const Color _primarySeed = Color(0xFF6750A4);
  static const Color _darkPrimarySeed = Color(0xFFD0BCFF);

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primarySeed,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(),
      cardTheme: _cardTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _darkPrimarySeed,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ),
      cardTheme: _cardTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }
}
```

### Color Scheme

#### Light Theme Colors

```dart
ColorScheme.fromSeed(
  seedColor: Color(0xFF6750A4), // Material 3 Purple
  brightness: Brightness.light,
)

// Generated colors:
// primary: #6750A4
// onPrimary: #FFFFFF
// primaryContainer: #E9DDFF
// onPrimaryContainer: #21005E
// surface: #FFFBFF
// onSurface: #1C1B1E
```

#### Dark Theme Colors

```dart
ColorScheme.fromSeed(
  seedColor: Color(0xFFD0BCFF), // Light Purple for dark theme
  brightness: Brightness.dark,
)

// Generated colors:
// primary: #D0BCFF
// onPrimary: #371E73
// primaryContainer: #4F378A
// onPrimaryContainer: #E9DDFF
// surface: #141218
// onSurface: #E7E2E8
```

### Typography

```dart
textTheme: GoogleFonts.interTextTheme()

// Available text styles:
// displayLarge: 57px, weight 400
// displayMedium: 45px, weight 400
// displaySmall: 36px, weight 400
// headlineLarge: 32px, weight 700
// headlineMedium: 28px, weight 600
// headlineSmall: 24px, weight 600
// titleLarge: 22px, weight 500
// titleMedium: 16px, weight 500
// titleSmall: 14px, weight 500
// bodyLarge: 16px, weight 400
// bodyMedium: 14px, weight 400
// bodySmall: 12px, weight 400
// labelLarge: 14px, weight 500
// labelMedium: 12px, weight 500
// labelSmall: 11px, weight 500
```

## Utility Functions

### Section Header Builder

Creates consistent section headers across pages.

```dart
Widget buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}
```

**Parameters:**

- `context`: Build context for theme access
- `title`: Section title text

**Returns:** Styled section header widget

### Settings Item Builder

Creates consistent settings items with icons and actions.

```dart
Widget buildSettingsItem({
  required BuildContext context,
  required String title,
  String? subtitle,
  required IconData icon,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  return Card(
    child: ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    ),
  );
}
```

**Parameters:**

- `context`: Build context for theme access
- `title`: Primary text for the item
- `subtitle`: Optional secondary text
- `icon`: Leading icon
- `trailing`: Optional trailing widget (switch, dropdown, etc.)
- `onTap`: Optional tap handler

**Returns:** Styled settings item widget

---

*This API documentation is part of Honyomi v2.0.0. For implementation examples, see [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md). For detailed design information, see [MATERIAL3_SUMMARY.md](MATERIAL3_SUMMARY.md).*