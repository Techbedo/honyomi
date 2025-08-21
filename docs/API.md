# API Documentation

This document provides detailed information about Honyomi's internal APIs and interfaces.

## Table of Contents

- [State Management API](#state-management-api)
- [File Management API](#file-management-api)
- [Dictionary API](#dictionary-api)
- [PDF Viewer API](#pdf-viewer-api)
- [Localization API](#localization-api)
- [Storage API](#storage-api)

## State Management API

### AppState Class

The main state management class that handles all application state.

#### Properties

```dart
class AppState extends ChangeNotifier {
  // Theme management
  AppTheme get currentTheme
  set currentTheme(AppTheme theme)
  
  // Localization
  AppLocale get currentLocale
  set currentLocale(AppLocale locale)
  
  // PDF state
  String? get currentPdfPath
  int get currentPage
  double get zoomLevel
  
  // Dictionary
  List<DictionaryEntry> get dictionary
  int get dictionaryWordCount
  
  // Recent files
  List<RecentFile> get recentFiles
  int get recentFilesCount
}
```

#### Methods

##### Theme Management

```dart
/// Set the application theme
Future<void> setTheme(AppTheme theme)

/// Get the current theme brightness
Brightness getBrightness()

/// Check if dark theme is active
bool get isDarkTheme
```

##### PDF Management

```dart
/// Open a PDF file
Future<bool> openPdf(String filePath)

/// Close current PDF
void closePdf()

/// Navigate to specific page
void goToPage(int pageNumber)

/// Set zoom level
void setZoomLevel(double zoom)

/// Go to next page
bool nextPage()

/// Go to previous page
bool previousPage()
```

##### Dictionary Management

```dart
/// Add new word to dictionary
Future<void> addWord(String word, String translation)

/// Update existing word
Future<void> updateWord(int index, String word, String translation)

/// Remove word from dictionary
Future<void> removeWord(int index)

/// Clear entire dictionary
Future<void> clearDictionary()

/// Search dictionary
List<DictionaryEntry> searchDictionary(String query)
```

##### File Management

```dart
/// Add file to recent files
void addRecentFile(String filePath)

/// Remove file from recent files
void removeRecentFile(String filePath)

/// Clear recent files list
void clearRecentFiles()

/// Check if file exists
bool checkFileExists(String filePath)
```

## File Management API

### RecentFile Class

Represents a recently opened file.

```dart
class RecentFile {
  final String path;
  final String name;
  final DateTime lastOpened;
  final bool exists;
  
  RecentFile({
    required this.path,
    required this.name,
    required this.lastOpened,
    required this.exists,
  });
  
  // Serialization
  Map<String, dynamic> toJson()
  factory RecentFile.fromJson(Map<String, dynamic> json)
}
```

### File Operations

```dart
/// Open file picker dialog
Future<String?> pickPdfFile()

/// Validate PDF file
bool validatePdfFile(String filePath)

/// Get file size
int getFileSize(String filePath)

/// Get file modification date
DateTime getFileModifiedDate(String filePath)
```

## Dictionary API

### DictionaryEntry Class

Represents a single dictionary entry.

```dart
class DictionaryEntry {
  final String word;
  final String translation;
  final DateTime createdAt;
  final DateTime? lastModified;
  
  DictionaryEntry({
    required this.word,
    required this.translation,
    required this.createdAt,
    this.lastModified,
  });
  
  // Serialization
  Map<String, dynamic> toJson()
  factory DictionaryEntry.fromJson(Map<String, dynamic> json)
  
  // Utility methods
  DictionaryEntry copyWith({
    String? word,
    String? translation,
    DateTime? lastModified,
  })
}
```

### Dictionary Operations

```dart
/// Import dictionary from file
Future<List<DictionaryEntry>> importDictionary(String filePath)

/// Export dictionary to file
Future<void> exportDictionary(String filePath, List<DictionaryEntry> entries)

/// Get dictionary statistics
DictionaryStats getDictionaryStats()
```

### DictionaryStats Class

```dart
class DictionaryStats {
  final int totalWords;
  final int wordsThisWeek;
  final int wordsThisMonth;
  final DateTime? firstWordDate;
  final DateTime? lastWordDate;
  
  DictionaryStats({
    required this.totalWords,
    required this.wordsThisWeek,
    required this.wordsThisMonth,
    this.firstWordDate,
    this.lastWordDate,
  });
}
```

## PDF Viewer API

### PDF Control Methods

```dart
/// Initialize PDF viewer
Future<void> initializePdfViewer(String filePath)

/// Get total page count
int getTotalPages()

/// Jump to specific page
void jumpToPage(int pageNumber)

/// Zoom in
void zoomIn()

/// Zoom out
void zoomOut()

/// Reset zoom
void resetZoom()

/// Get current zoom level
double getCurrentZoom()

/// Get selected text
String? getSelectedText()

/// Clear text selection
void clearSelection()
```

### PDF Viewer Events

```dart
/// Page changed callback
typedef PageChangedCallback = void Function(int pageNumber);

/// Text selected callback
typedef TextSelectedCallback = void Function(String selectedText);

/// Zoom changed callback
typedef ZoomChangedCallback = void Function(double zoomLevel);
```

## Localization API

### Supported Locales

```dart
enum AppLocale {
  english('en'),
  ukrainian('uk');
  
  const AppLocale(this.code);
  final String code;
  
  static AppLocale fromCode(String code) {
    return values.firstWhere((locale) => locale.code == code);
  }
}
```

### Localization Methods

```dart
/// Get localized string
String getLocalizedString(String key, {Map<String, dynamic>? args})

/// Change application locale
Future<void> changeLocale(AppLocale locale)

/// Get current locale
AppLocale getCurrentLocale()

/// Get available locales
List<AppLocale> getAvailableLocales()
```

### Localization Keys

#### Common Keys
- `appTitle`: Application title
- `loading`: Loading indicator text
- `error`: Generic error message
- `success`: Success message
- `cancel`: Cancel button
- `save`: Save button
- `delete`: Delete button
- `edit`: Edit button

#### Page-specific Keys
- `library.*`: Library page strings
- `dictionary.*`: Dictionary page strings
- `settings.*`: Settings page strings
- `about.*`: About page strings
- `pdfViewer.*`: PDF viewer strings

## Storage API

### SharedPreferences Keys

```dart
class StorageKeys {
  static const String theme = 'app_theme';
  static const String locale = 'app_locale';
  static const String dictionary = 'dictionary_entries';
  static const String recentFiles = 'recent_files';
  static const String currentPdf = 'current_pdf_path';
  static const String currentPage = 'current_page';
  static const String zoomLevel = 'zoom_level';
}
```

### Storage Operations

```dart
/// Save application state
Future<void> saveAppState()

/// Load application state
Future<void> loadAppState()

/// Clear all stored data
Future<void> clearAllData()

/// Get storage usage
Future<StorageInfo> getStorageInfo()
```

### StorageInfo Class

```dart
class StorageInfo {
  final int dictionarySize;
  final int recentFilesSize;
  final int settingsSize;
  final int totalSize;
  
  StorageInfo({
    required this.dictionarySize,
    required this.recentFilesSize,
    required this.settingsSize,
    required this.totalSize,
  });
}
```

## Error Handling

### Custom Exceptions

```dart
class HonyomiException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  
  const HonyomiException(this.message, {this.code, this.originalError});
  
  @override
  String toString() => 'HonyomiException: $message';
}

class PdfException extends HonyomiException {
  const PdfException(String message) : super(message, code: 'PDF_ERROR');
}

class DictionaryException extends HonyomiException {
  const DictionaryException(String message) : super(message, code: 'DICT_ERROR');
}

class StorageException extends HonyomiException {
  const StorageException(String message) : super(message, code: 'STORAGE_ERROR');
}
```

### Error Handling Patterns

```dart
/// Use try-catch for async operations
try {
  await appState.openPdf(filePath);
} on PdfException catch (e) {
  // Handle PDF-specific errors
  showErrorDialog(context, e.message);
} catch (e) {
  // Handle general errors
  showErrorDialog(context, 'An unexpected error occurred');
}

/// Use Result pattern for operations that might fail
Result<List<DictionaryEntry>, DictionaryException> loadDictionary() {
  try {
    final entries = // ... load dictionary
    return Result.success(entries);
  } catch (e) {
    return Result.failure(DictionaryException('Failed to load dictionary'));
  }
}
```

## Events and Callbacks

### Event System

```dart
/// Base event class
abstract class AppEvent {
  final DateTime timestamp;
  
  AppEvent() : timestamp = DateTime.now();
}

/// Specific event types
class PdfOpenedEvent extends AppEvent {
  final String filePath;
  PdfOpenedEvent(this.filePath);
}

class WordAddedEvent extends AppEvent {
  final DictionaryEntry entry;
  WordAddedEvent(this.entry);
}

class ThemeChangedEvent extends AppEvent {
  final AppTheme newTheme;
  ThemeChangedEvent(this.newTheme);
}

/// Event handler
typedef EventHandler<T extends AppEvent> = void Function(T event);

/// Event bus
class EventBus {
  static final _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();
  
  final Map<Type, List<EventHandler>> _handlers = {};
  
  void subscribe<T extends AppEvent>(EventHandler<T> handler) {
    _handlers.putIfAbsent(T, () => []).add(handler);
  }
  
  void publish<T extends AppEvent>(T event) {
    _handlers[T]?.forEach((handler) => handler(event));
  }
}
```

## Testing APIs

### Mock Classes

```dart
class MockAppState extends Mock implements AppState {}
class MockPdfViewer extends Mock implements PdfViewer {}
class MockFileService extends Mock implements FileService {}
```

### Test Utilities

```dart
/// Create test app state
AppState createTestAppState({
  AppTheme? theme,
  List<DictionaryEntry>? dictionary,
  List<RecentFile>? recentFiles,
}) {
  final state = AppState();
  if (theme != null) state.setTheme(theme);
  if (dictionary != null) state._dictionary = dictionary;
  if (recentFiles != null) state._recentFiles = recentFiles;
  return state;
}

/// Create test dictionary entry
DictionaryEntry createTestEntry({
  String word = 'test',
  String translation = 'тест',
  DateTime? createdAt,
}) {
  return DictionaryEntry(
    word: word,
    translation: translation,
    createdAt: createdAt ?? DateTime.now(),
  );
}
```

---

*For more information, see the [Developer Guide](DEVELOPER_GUIDE.md) and [User Guide](USER_GUIDE.md).*
