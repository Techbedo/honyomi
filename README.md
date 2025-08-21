<div align="center">
  <img src="assets/icons/icon.png" alt="Honyomi Icon" width="128" height="128">
  
  # Honyomi
  **Your Smart Language Learning Reader**

  *Enhance your language learning journey with Honyomi!*

  
[![Language](https://img.shields.io/badge/Language-Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Framework](https://img.shields.io/badge/Framework-Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![UI Design](https://img.shields.io/badge/UI-Fluent%20Design-0078D4?logo=microsoft&logoColor=white)](https://github.com/bdlukaa/fluent_ui)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20iOS%20%7C%20Web-lightgrey)](https://flutter.dev/docs/development/tools/sdk/release-notes/supported-platforms)
[![License](https://img.shields.io/badge/License-Apache%202.0-green?logo=apache)](LICENSE)
[![Version](https://img.shields.io/github/v/release/Techbedo/honyomi?sort=semver&label=Version&logo=github&logoColor=white)](https://github.com/Techbedo/honyomi/releases)

  **Languages:** **🇺🇸 English** | [🇺🇦 Українська](README_UK.md)

</div>

---

## 📖 About

Honyomi is a modern PDF reader application designed specifically for language learners. Built with Flutter and Fluent UI, it provides a seamless reading experience while helping you build your vocabulary.

## Features

### 📚 PDF Reading
- **Advanced PDF Viewer**: View PDF documents with smooth navigation
- **Zoom Controls**: Zoom in/out to adjust text size for comfortable reading
- **Page Navigation**: Easy navigation between pages with Previous/Next buttons
- **Compact Command Bar**: Quick access to essential tools while reading

### 📖 Library Management
- **Recent Files**: Quick access to your last 10 opened PDF files
- **File Browser Integration**: Open PDF files from anywhere on your system
- **File Status**: Visual indicators for missing or moved files

### 📝 Personal Dictionary
- **Word Collection**: Add words directly from PDF text selection
- **Translation Support**: Store words with their translations
- **Dictionary Management**: Edit, copy, and delete dictionary entries
- **Progress Tracking**: See how many words you've collected

### 🎨 Modern Interface
- **Fluent Design**: Beautiful, Windows 11-style interface
- **Theme Support**: Light, dark, and system themes
- **Responsive Layout**: Adaptive interface for different screen sizes
- **Navigation Pane**: Easy switching between different sections

### 🌍 Multi-language Support
- **Interface Languages**: English and Ukrainian
- **Context-aware Localization**: Interface adapts to your language preference
- **Future Extensions**: Built to support additional languages

### ⚙️ Smart Features
- **Context Menu**: Right-click selected text for quick actions
- **Auto-save**: Your settings and dictionary are automatically saved
- **Cross-platform**: Designed to work on Windows, Android, iOS, and Web

## Getting Started

### Installation

1. Download the latest release from the [Releases](https://github.com/Techbedo/honyomi/releases) page
2. Install the application for your platform
3. Launch Honyomi and start reading!

### Usage

1. **Open a PDF**: Click "Open PDF" in the Library section or use File → Open
2. **Read and Learn**: Navigate through your document using the command bar
3. **Build Vocabulary**: Select text to add words to your dictionary
4. **Customize**: Adjust themes and language in Settings

## Technical Details

### Built With
- **Flutter 3.35.0**: Cross-platform development framework
- **Fluent UI 4.11.0**: Microsoft's design system for Windows
- **Syncfusion PDF Viewer**: Advanced PDF rendering
- **Provider**: State management
- **Shared Preferences**: Local data storage

### Supported Platforms
- ✅ Windows
- ✅ Android
- ✅ iOS
- ✅ Web

### Architecture
- **MVVM Pattern**: Clean separation of concerns
- **Provider State Management**: Reactive UI updates
- **Local Storage**: Persistent user data
- **Modular Design**: Easy to extend and maintain

## Development

### Prerequisites
- Flutter 3.35.0+
- Dart 3.9.0+
- Visual Studio 2022 (for Windows)
- Android Studio (for Android)
- Xcode (for iOS)

### Building from Source

```bash
# Clone the repository
git clone https://github.com/Techbedo/honyomi.git
cd honyomi

# Install dependencies
flutter pub get

# Run on Windows
flutter run -d windows

# Build for release
flutter build windows
```

### Project Structure
```
lib/
├── main.dart                 # Application entry point
├── providers/                # State management
│   └── app_state.dart
├── pages/                    # Application screens
│   ├── library_page.dart
│   ├── dictionary_page.dart
│   ├── pdf_viewer_page.dart
│   ├── settings_page.dart
│   └── about_page.dart
└── l10n/                    # Internationalization
    ├── app_en.arb
    └── app_uk.arb
```

## 📋 Documentation

Detailed documentation can be found in the [docs/](docs/) folder:

- [📖 User Guide](docs/USER_GUIDE.md)
- [💻 Developer Guide](docs/DEVELOPER_GUIDE.md)
- [📝 Changelog](docs/CHANGELOG.md)
- [🔧 API Documentation](docs/API.md)

## 🤝 Contributing

We welcome contributions! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Guidelines
- Follow Flutter/Dart style guidelines
- Write descriptive commit messages
- Add tests for new features
- Update documentation as needed

---
<div align="center">

  <div align="center">
  <strong>Made with ❤️ by <a href="https://techbedo.com">Techbedo</a></strong>
  
  *Enhance your language learning journey with Honyomi!*
</div>
