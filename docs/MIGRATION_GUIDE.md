# Migration Guide: Fluent UI to Material 3

This guide outlines the migration from Fluent UI to Material 3 in Honyomi and provides guidance for developers working with the new design system.

## Overview

Honyomi v1.0.1 represents a complete UI framework migration from Microsoft's Fluent UI to Google's Material 3 design system. This change brings modern design principles, better accessibility, and improved cross-platform consistency.

## Key Changes

### 1. UI Framework

#### Before (Fluent UI)

```dart
import 'package:fluent_ui/fluent_ui.dart';

FluentApp(
  theme: FluentThemeData(
    brightness: Brightness.light,
  ),
  // ...
)
```

#### After (Material 3)

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(),
  ),
  // ...
)
```

### 2. Navigation

#### Before (NavigationView)

```dart
NavigationView(
  pane: NavigationPane(
    items: [
      PaneItem(
        icon: const Icon(FluentIcons.library),
        title: const Text('Library'),
        body: const LibraryPage(),
      ),
      // ...
    ],
  ),
)
```

#### After (NavigationRail)

```dart
Scaffold(
  body: Row(
    children: [
      NavigationRail(
        selectedIndex: _selectedIndex < 2 ? _selectedIndex : null,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.library_books_outlined),
            selectedIcon: Icon(Icons.library_books),
            label: Text(S.of(context).library),
          ),
          // ...
        ],
        // ...
      ),
      // Page content
    ],
  ),
)
```

### 3. Theming

#### Before (Fluent Theming)

```dart
FluentThemeData(
  brightness: Brightness.light,
  accentColor: Colors.blue,
  // ...
)
```

#### After (Material 3 Theming)

```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme(),
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  // ...
)
```

### 4. Components

#### Cards

**Before:**

```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Content'),
  ),
)
```

**After:**

```dart
Card(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Content
      ],
    ),
  ),
)
```

#### Buttons

**Before:**

```dart
FilledButton(
  onPressed: () {},
  child: Text('Action'),
)
```

**After:**

```dart
FilledButton.icon(
  onPressed: () {},
  icon: Icon(Icons.add),
  label: Text(S.of(context).action),
)
```

### 5. Localization

#### Before (Basic Localization)

```dart
// Basic localization files
AppLocalizations.of(context)?.title
```

#### After (intl_utils with ARB)

```dart
// Generated S class with type safety
S.of(context).title

// ARB files with metadata
{
  "title": "Application Title",
  "@title": {
    "description": "The main title of the application"
  }
}
```

## Typography Migration

### Font System

Material 3 uses the Inter font family for enhanced readability:

```dart
// Text styles with Inter font
Text(
  'Heading',
  style: GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.1,
  ),
)

Text(
  'Body text',
  style: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  ),
)
```

### Typography Scale

| Element | Font Size | Weight | Letter Spacing |
|---------|-----------|---------|----------------|
| Headline Large | 32px | 700 | -1px |
| Headline Medium | 28px | 600 | -0.5px |
| Title Large | 22px | 500 | 0px |
| Title Medium | 16px | 500 | 0.1px |
| Body Large | 16px | 400 | 0.1px |
| Body Medium | 14px | 400 | 0.2px |
| Label Large | 14px | 500 | 0.1px |
| Label Medium | 12px | 500 | 0.4px |

## Color System

### Material 3 Color Tokens

```dart
// Primary colors
Theme.of(context).colorScheme.primary        // #6750A4
Theme.of(context).colorScheme.onPrimary      // #FFFFFF
Theme.of(context).colorScheme.primaryContainer // #E9DDFF
Theme.of(context).colorScheme.onPrimaryContainer // #21005E

// Surface colors
Theme.of(context).colorScheme.surface        // #FFFBFF
Theme.of(context).colorScheme.onSurface      // #1C1B1E
Theme.of(context).colorScheme.surfaceVariant // #E7E0EC
Theme.of(context).colorScheme.onSurfaceVariant // #49454E
```

### Dark Theme Colors

```dart
// Dark mode equivalents
ColorScheme.fromSeed(
  seedColor: const Color(0xFFD0BCFF),
  brightness: Brightness.dark,
)
```

## Layout Patterns

### Card-based Layouts

```dart
Widget _buildInfoCard(BuildContext context, String title, String content, IconData icon) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
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

### Navigation Rail Pattern

```dart
NavigationRail(
  selectedIndex: _selectedIndex < destinations.length ? _selectedIndex : null,
  onDestinationSelected: (int index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  labelType: NavigationRailLabelType.all,
  destinations: [
    // Regular destinations
  ],
  trailing: Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bottom navigation items
          ],
        ),
      ),
    ),
  ),
)
```

## State Management

### Provider Pattern

```dart
class AppState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');
  
  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
    // Persist to storage
  }
  
  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
    // Persist to storage
  }
}
```

## Best Practices

### 1. Accessibility

- Use semantic colors from the Material 3 color system
- Ensure proper contrast ratios
- Implement proper focus management
- Use semantic widgets and properties

### 2. Performance

- Use `const` constructors where possible
- Implement proper widget disposal
- Optimize image and font loading
- Use efficient state management patterns

### 3. Responsive Design

- Use flexible layouts with `Flex` widgets
- Implement proper breakpoints for different screen sizes
- Use adaptive components where necessary
- Test on multiple device sizes

### 4. Theming Consistency

- Use theme colors consistently throughout the app
- Implement proper typography hierarchy
- Maintain consistent spacing and sizing
- Follow Material 3 motion specifications

## Testing Migration

### Widget Tests

```dart
testWidgets('Material 3 component test', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
        useMaterial3: true,
      ),
      home: const YourWidget(),
    ),
  );
  
  // Test Material 3 specific behaviors
  expect(find.byType(NavigationRail), findsOneWidget);
  expect(find.byType(Card), findsWidgets);
});
```

## Common Issues and Solutions

### 1. NavigationRail Index Issues

**Problem**: `selectedIndex >= destinations.length` assertion error

**Solution**:

```dart
NavigationRail(
  selectedIndex: _selectedIndex < destinations.length ? _selectedIndex : null,
  // ...
)
```

### 2. Theme Color Issues

**Problem**: Colors not updating with theme changes

**Solution**:

```dart
// Use theme colors instead of hardcoded colors
color: Theme.of(context).colorScheme.primary,
// Not: color: Colors.blue,
```

### 3. Typography Issues

**Problem**: Inconsistent text styling

**Solution**:

```dart
// Use consistent GoogleFonts.inter() calls
Text(
  'Content',
  style: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
)
```

## Resources

- [Material 3 Design System](https://m3.material.io/)
- [Flutter Material 3 Documentation](https://docs.flutter.dev/ui/design/material)
- [Google Fonts Package](https://pub.dev/packages/google_fonts)
- [intl_utils Package](https://pub.dev/packages/intl_utils)

## Support

If you encounter issues during migration or need assistance with Material 3 implementation, please:

1. Check the [GitHub Issues](https://github.com/Techbedo/honyomi/issues)
2. Review the [API Documentation](API.md)
3. Consult the [Material 3 Guidelines](https://m3.material.io/foundations)

---

*This migration guide is part of Honyomi v2.0.0 documentation. For more information, see the [CHANGELOG.md](CHANGELOG.md) and [README.md](../README.md).*
