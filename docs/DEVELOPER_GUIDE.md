# Developer Guide

This guide provides detailed information for developers who want to contribute to Honyomi or understand its architecture.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Project Structure](#project-structure)
- [Development Setup](#development-setup)
- [State Management](#state-management)
- [UI Components](#ui-components)
- [Localization](#localization)
- [Testing](#testing)
- [Building & Deployment](#building--deployment)
- [Contributing Guidelines](#contributing-guidelines)

## Architecture Overview

Honyomi follows the **MVVM (Model-View-ViewModel)** pattern with the following architectural principles:

### Core Principles

1. **Separation of Concerns** - Clear separation between UI, business logic, and data
2. **Reactive Programming** - UI automatically updates when data changes
3. **Modular Design** - Components are loosely coupled and easily testable
4. **Cross-platform Ready** - Architecture supports multiple platforms

### Technology Stack

- **Framework**: Flutter 3.35.0
- **Language**: Dart 3.9.0
- **UI Library**: Fluent UI 4.11.0
- **State Management**: Provider
- **PDF Rendering**: Syncfusion PDF Viewer
- **Local Storage**: SharedPreferences
- **File Handling**: file_picker
- **Routing**: go_router
- **Internationalization**: flutter_localizations

## Project Structure

```
lib/
├── main.dart                    # Application entry point
├── providers/                   # State management
│   └── app_state.dart          # Main application state
├── pages/                      # UI screens
│   ├── library_page.dart       # File management
│   ├── pdf_viewer_page.dart    # PDF reading interface
│   ├── dictionary_page.dart    # Vocabulary management
│   ├── settings_page.dart      # App configuration
│   └── about_page.dart         # Information screen
├── l10n/                       # Internationalization
│   ├── app_en.arb             # English translations
│   └── app_uk.arb             # Ukrainian translations
└── generated/                  # Auto-generated files
    └── l10n/                   # Generated localization

assets/
├── icons/                      # App icons
│   ├── icon.png               # Main app icon
│   └── app_icon_placeholder.txt
└── ...

docs/                           # Documentation
├── CHANGELOG.md               # Version history
├── USER_GUIDE.md             # User documentation
├── DEVELOPER_GUIDE.md        # This file
└── API.md                    # API documentation

test/                          # Unit and widget tests
├── widget_test.dart          # Main widget tests
└── ...
```

## Development Setup

### Prerequisites

Ensure you have the following installed:

- **Flutter SDK 3.35.0+**
- **Dart SDK 3.9.0+**
- **Visual Studio 2022** (for Windows development)
- **Git** for version control

### Environment Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Techbedo/honyomi.git
   cd honyomi
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate localization files:**
   ```bash
   flutter gen-l10n
   ```

4. **Run the application:**
   ```bash
   flutter run -d windows
   ```

### IDE Setup

**Recommended: Visual Studio Code**

Install these extensions:
- Flutter
- Dart
- Flutter Intl (for localization)
- GitLens (for git integration)

**Alternative: Android Studio / IntelliJ IDEA**

Install Flutter and Dart plugins.

## State Management

### Provider Pattern

Honyomi uses the Provider pattern for state management, implemented through the `app_state.dart` file.

#### AppState Class

```dart
class AppState extends ChangeNotifier {
  // Theme management
  AppTheme _currentTheme = AppTheme.system;
  
  // Localization
  AppLocale _currentLocale = AppLocale.english;
  
  // PDF state
  String? _currentPdfPath;
  int _currentPage = 0;
  
  // Dictionary
  List<DictionaryEntry> _dictionary = [];
  
  // Recent files
  List<RecentFile> _recentFiles = [];
}
```

#### Key State Management Concepts

1. **ChangeNotifier**: All state changes trigger UI updates
2. **Persistence**: State is saved to SharedPreferences
3. **Reactive UI**: Widgets rebuild automatically when state changes

### State Flow

```
User Action → State Change → notifyListeners() → UI Update
     ↓              ↓
Save to Storage   Persist Data
```

## UI Components

### Fluent UI Integration

Honyomi uses Microsoft's Fluent UI design system:

#### Key Components Used

- **NavigationView**: Main app navigation
- **NavigationPane**: Side navigation panel
- **CommandBar**: PDF viewer controls
- **ContentDialog**: Modal dialogs
- **ComboBox**: Settings dropdowns
- **Button**: Various action buttons
- **InfoLabel**: Form labels
- **TextBox**: Text input fields

#### Theme Integration

```dart
FluentApp(
  theme: FluentThemeData(
    brightness: _getBrightness(),
    accentColor: Colors.blue,
  ),
  darkTheme: FluentThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.blue,
  ),
  themeMode: _getThemeMode(),
)
```

### Custom Widgets

While Honyomi primarily uses Fluent UI components, custom widgets are created for:

- **Recent File Cards**: Library display
- **Dictionary Entry Cards**: Word display
- **PDF Viewer Container**: PDF rendering wrapper

## Localization

### Internationalization Setup

Honyomi supports multiple languages through Flutter's internationalization system.

#### Configuration

**l10n.yaml:**
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

#### Adding New Strings

1. **Add to English ARB file** (`lib/l10n/app_en.arb`):
   ```json
   {
     "helloWorld": "Hello World!",
     "@helloWorld": {
       "description": "A simple greeting"
     }
   }
   ```

2. **Add to Ukrainian ARB file** (`lib/l10n/app_uk.arb`):
   ```json
   {
     "helloWorld": "Привіт світ!"
   }
   ```

3. **Regenerate localization files:**
   ```bash
   flutter gen-l10n
   ```

4. **Use in code:**
   ```dart
   Text(AppLocalizations.of(context)!.helloWorld)
   ```

#### Adding New Languages

1. Create new ARB file (e.g., `app_fr.arb`)
2. Add locale to `MaterialApp.supportedLocales`
3. Update `AppLocale` enum in `app_state.dart`

## Testing

### Test Structure

```
test/
├── unit/                      # Unit tests
│   ├── providers/            # State management tests
│   └── utils/               # Utility function tests
├── widget/                   # Widget tests
│   ├── pages/               # Page widget tests
│   └── components/          # Component tests
└── integration/             # Integration tests
    └── app_test.dart        # Full app flow tests
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/providers/app_state_test.dart

# Run with coverage
flutter test --coverage
```

### Writing Tests

#### Unit Test Example

```dart
void main() {
  group('AppState Tests', () {
    late AppState appState;
    
    setUp(() {
      appState = AppState();
    });
    
    test('should change theme correctly', () {
      appState.setTheme(AppTheme.dark);
      expect(appState.currentTheme, AppTheme.dark);
    });
  });
}
```

#### Widget Test Example

```dart
void main() {
  testWidgets('Library page shows recent files', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MyApp(),
      ),
    );
    
    expect(find.text('Recent Files'), findsOneWidget);
  });
}
```

## Building & Deployment

### Development Builds

```bash
# Windows
flutter run -d windows

# Android (with device connected)
flutter run -d android

# Web
flutter run -d chrome
```

### Release Builds

```bash
# Windows
flutter build windows --release

# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### Build Configuration

#### Windows

**windows/CMakeLists.txt** configuration:
- Minimum Windows version: Windows 10 1809
- Architecture: x64
- Dependencies: Visual C++ Redistributable

#### Android

**android/app/build.gradle** configuration:
- Minimum SDK: 21 (Android 5.0)
- Target SDK: 34 (Android 14)
- Compile SDK: 34

### Continuous Integration

#### GitHub Actions (Planned)

```yaml
name: Build and Test
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter test
  
  build-windows:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build windows
```

## Contributing Guidelines

### Code Style

1. **Follow Dart Style Guide**: Use `dart format` and `dart analyze`
2. **Naming Conventions**:
   - Classes: PascalCase
   - Variables/Functions: camelCase
   - Constants: SCREAMING_SNAKE_CASE
   - Files: snake_case

3. **Documentation**: All public APIs must have documentation comments

### Git Workflow

1. **Branch Strategy**: 
   - `main`: Stable releases
   - `develop/flutter`: Development branch
   - `feature/*`: New features
   - `bugfix/*`: Bug fixes

2. **Commit Messages**: Follow conventional commit format
   ```
   feat: add new PDF zoom controls
   fix: resolve dictionary save issue
   docs: update developer guide
   ```

3. **Pull Requests**:
   - Create from feature branch to `develop/flutter`
   - Include tests for new features
   - Update documentation as needed
   - Pass all CI checks

### Performance Guidelines

1. **Widget Building**:
   - Use `const` constructors where possible
   - Implement `build` method efficiently
   - Avoid expensive operations in `build`

2. **State Management**:
   - Minimize `notifyListeners()` calls
   - Use selective rebuilding with `Consumer`
   - Dispose resources properly

3. **Memory Management**:
   - Dispose controllers and listeners
   - Use weak references for callbacks
   - Monitor memory usage during development

### Security Considerations

1. **File Access**: Validate file paths and permissions
2. **Data Storage**: Encrypt sensitive data if needed
3. **Dependencies**: Keep dependencies updated
4. **Input Validation**: Sanitize user inputs

## API Documentation

For detailed API documentation, see [API.md](API.md).

## Troubleshooting Development Issues

### Common Issues

**Build Errors:**
- Run `flutter clean` and `flutter pub get`
- Check Flutter/Dart versions
- Verify platform-specific dependencies

**Hot Reload Not Working:**
- Restart debug session
- Check for syntax errors
- Verify file is saved

**Localization Issues:**
- Run `flutter gen-l10n`
- Check ARB file syntax
- Verify locale codes

### Getting Help

- **Documentation**: Check this guide and user documentation
- **Issues**: Create GitHub issue with reproduction steps
- **Discussions**: Use GitHub Discussions for questions
- **Community**: Join Flutter Discord/Reddit communities

---

*Happy coding! 🚀*
