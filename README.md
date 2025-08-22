<div align="center">
  <img src="assets/icons/icon.png" alt="Honyomi Icon" width="128" height="128">
  
  # Honyomi
  **Your Smart Language Learning Reader**

  *Enhance your language learning journey with Honyomi!*

  
[![Language](https://img.shields.io/badge/Language-Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Framework](https://img.shields.io/badge/Framework-Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![UI Design](https://img.shields.io/badge/UI-Material%203-6750A4?logo=material-design&logoColor=white)](https://m3.material.io/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20iOS%20%7C%20Web-lightgrey)](https://flutter.dev/docs/development/tools/sdk/release-notes/supported-platforms)
[![License](https://img.shields.io/badge/License-Apache%202.0-green?logo=apache)](LICENSE)
[![Version](https://img.shields.io/github/v/release/Techbedo/honyomi?sort=semver&label=Version&logo=github&logoColor=white)](https://github.com/Techbedo/honyomi/releases)

  **Languages:** **🇺🇸 English** | [🇺🇦 Українська](README_UK.md)

</div>

---

## 📖 About

Honyomi is a modern PDF reader application designed specifically for language learners. Built with Flutter and Google's Material 3 design system, it provides a seamless reading experience with beautiful, accessible interfaces while helping you build your vocabulary.

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
- **Material 3 Design**: Beautiful, modern interface following Google's latest design system
- **Inter Typography**: Professional Inter font family for exceptional readability
- **Dynamic Theming**: Adaptive Material You color schemes with light and dark modes
- **Navigation Rail**: Efficient navigation with Material 3 components
- **Responsive Layout**: Adaptive interface for different screen sizes and orientations
- **Accessibility**: Built-in accessibility features following Material Design guidelines

### 🌍 Multi-language Support

- **Professional Localization**: Complete internationalization using intl_utils
- **Interface Languages**: English and Ukrainian with context-aware translations
- **Metadata Support**: Translation metadata for professional localization workflows
- **Future Extensions**: Built to easily support additional languages

### ⚙️ Smart Features

- **Context Menu**: Right-click selected text for quick actions
- **Auto-save**: Your settings and dictionary are automatically saved
- **Cross-platform**: Designed to work on Windows, Android, iOS, and Web

## 🆕 What's New in Material 3

Honyomi has been completely redesigned with Google's Material 3 design system:

### 🎨 **Modern Design Language**
- **Dynamic Color System**: Beautiful, adaptive color palettes that respond to your content
- **Enhanced Typography**: Professional Inter font family for superior readability
- **Improved Accessibility**: Better contrast ratios and accessibility features
- **Consistent Components**: Material 3 components throughout the entire application

### 🚀 **Technical Improvements**
- **Navigation Rail**: Replaced traditional navigation with Material 3's efficient NavigationRail
- **Professional Localization**: Complete migration to intl_utils with ARB-based translations
- **State Management**: Enhanced Provider-based state management for themes and localization
- **Performance Optimizations**: Improved rendering and smoother animations

### 📱 **User Experience Enhancements**
- **Adaptive Interfaces**: Layouts that respond beautifully to different screen sizes
- **Intuitive Navigation**: Streamlined user flows with Material 3 interaction patterns
- **Enhanced Readability**: Improved typography hierarchy and spacing
- **Theme Consistency**: Unified visual language across all application screens

---

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
- **Material 3**: Google's latest design system with dynamic theming
- **Google Fonts (Inter)**: Professional typography for enhanced readability
- **intl_utils**: Professional internationalization with ARB files
- **Provider**: Reactive state management
- **Syncfusion PDF Viewer**: Advanced PDF rendering capabilities

### Supported Platforms

- ✅ Windows
- ✅ Android
- ✅ iOS
- ✅ Web

### Architecture

- **Material 3 Design Pattern**: Clean, accessible, and beautiful interfaces
- **Provider State Management**: Reactive UI updates with proper separation of concerns
- **Professional Localization**: ARB-based translations with metadata support
- **Modular Component Design**: Easy to extend and maintain with Material 3 components

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

```dart
lib/
├── main.dart                 # Application entry point with Material 3 theming
├── providers/                # State management
│   └── app_state.dart       # Application state with theme and locale management
├── pages/                    # Material 3 application screens
│   ├── library_page.dart    # Library management with NavigationRail
│   ├── dictionary_page.dart # Personal dictionary with Material 3 cards
│   ├── pdf_viewer_page.dart # PDF viewer with Material 3 controls
│   ├── settings_page.dart   # Settings with Material 3 form components
│   └── about_page.dart      # About page with Material 3 info cards
├── generated/               # Auto-generated localization
│   └── l10n.dart           # Generated S class for translations
└── l10n/                   # Internationalization resources
    ├── intl_en.arb         # English translations with metadata
    └── intl_uk.arb         # Ukrainian translations with metadata
```

## 📋 Documentation

Complete documentation is available in the [docs/](docs/) folder:

### 📚 **User Documentation**

- **[📖 User Guide](docs/USER_GUIDE.md)** - Complete user documentation with tutorials and features
- **[🇺🇦 Посібник Користувача](docs/USER_GUIDE_uk.md)** - Повна документація українською мовою

### 🔧 **Technical Documentation**

- **[� API Documentation](docs/API.md)** - Complete API reference for Material 3 components and localization
- **[�💻 Developer Guide](docs/DEVELOPER_GUIDE.md)** - Development setup, architecture, and contribution guidelines
- **[🚀 Migration Guide](docs/MIGRATION_GUIDE.md)** - Detailed guide for migrating from Fluent UI to Material 3
- **[📋 Material 3 Summary](docs/MATERIAL3_SUMMARY.md)** - Comprehensive overview of Material 3 implementation

### 📝 **Project History**

- **[📝 Changelog](docs/CHANGELOG.md)** - Version history and release notes

### 🔗 **Quick Links**

| Document | Purpose | Audience |
|----------|---------|----------|
| [User Guide](docs/USER_GUIDE.md) | Learn how to use Honyomi | End Users |
| [Developer Guide](docs/DEVELOPER_GUIDE.md) | Setup and contribute to Honyomi | Developers |
| [API Documentation](docs/API.md) | Technical API reference | Developers |
| [Migration Guide](docs/MIGRATION_GUIDE.md) | Migration from Fluent UI to Material 3 | Developers |
| [Material 3 Summary](docs/MATERIAL3_SUMMARY.md) | Material 3 design implementation | Designers & Developers |

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
