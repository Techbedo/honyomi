# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Cloud synchronization for dictionary
- Mobile optimization
- Enhanced PDF annotation features

## [0.1.2] - 2025-09-03
### Patch
- Fixed: Marking a word as learned now correctly updates its state in the database and UI. Words move to the 'Learned' section and disappear from the main screen as expected.

## [0.1.1] - 2025-09-03

### Added
- Context menu for adding words in PDF and Dictionary (unified dialog)
- Dropdown for theme selection (Light/Dark/System) in settings
- Dictionary search and filtering: tabs All/New/Learned, search by word/translation
- All word types available when adding
- Unified AddWordDialog widget for both PDF and Dictionary

### Changed
- All SnackBars replaced with awesome_snackbar_content and localized texts
- Consistent vertical spacing between settings blocks
- Improved code structure, Provider usage, separation of concerns

### Removed
- Obsolete files removed (*_new.dart, *_backup.dart)

### Documentation
- Updated USER_GUIDE, CHANGELOG, API.md to reflect new features and changes


## [0.0.2] - 2025-08-22

### 🚀 Major Changes

#### UI Framework Migration
- **BREAKING**: Complete migration from Fluent UI to Material 3
- **BREAKING**: Replaced NavigationView with NavigationRail for improved navigation
- **NEW**: Implemented Google's Material 3 design system throughout the application
- **NEW**: Added Inter font family via Google Fonts for enhanced typography

#### Localization System Overhaul
- **BREAKING**: Migrated from basic localization to professional intl_utils system
- **NEW**: Implemented ARB-based translations with metadata support
- **NEW**: Auto-generated S class for type-safe localization
- **IMPROVED**: Enhanced translation management workflow

#### Design System Improvements
- **NEW**: Material 3 color schemes with adaptive theming
- **NEW**: Dynamic color palettes that respond to system preferences
- **NEW**: Improved accessibility features following Material Design guidelines
- **NEW**: Enhanced typography hierarchy with Inter font family
- **NEW**: Consistent component styling across all screens

### ✨ New Features

#### User Interface
- **NEW**: Navigation Rail with bottom section for Settings/About pages
- **NEW**: Material 3 card-based layouts for better content organization
- **NEW**: Enhanced Settings page with sectioned design
- **NEW**: Redesigned About page with feature showcase
- **NEW**: Professional theme switching with preview

#### Technical Features
- **NEW**: Provider-based state management for app-wide settings
- **NEW**: Theme persistence across app sessions
- **NEW**: Locale persistence with system language detection
- **NEW**: Enhanced error handling and user feedback

### 🔧 Technical Improvements

#### Dependencies
- **UPDATED**: Flutter 3.35.0 compatibility
- **ADDED**: google_fonts 6.2.1 for professional typography
- **ADDED**: intl_utils 2.8.11 for localization management
- **ADDED**: awesome_snackbar_content 0.1.8 for enhanced notifications
- **REMOVED**: fluent_ui dependency (replaced with Material 3)

#### Architecture
- **IMPROVED**: Clean architecture with better separation of concerns
- **IMPROVED**: Enhanced Provider state management patterns
- **IMPROVED**: Modular component design for better maintainability
- **IMPROVED**: Type-safe localization with generated classes

#### Performance
- **IMPROVED**: Faster app startup with optimized dependency loading
- **IMPROVED**: Better memory management with proper widget disposal
- **IMPROVED**: Smoother animations with Material 3 motion specifications

### 🐛 Bug Fixes
- **FIXED**: NavigationRail selectedIndex assertion error
- **FIXED**: Theme switching not persisting across app restarts
- **FIXED**: Localization fallback handling
- **FIXED**: Layout overflow issues on smaller screens
- **FIXED**: Incorrect license information (now Apache License 2.0)

### 📚 Documentation
- **UPDATED**: README.md with Material 3 information
- **UPDATED**: README_UK.md with Ukrainian localization updates
- **ADDED**: Comprehensive migration guide (MIGRATION_GUIDE.md)
- **ADDED**: Material 3 summary documentation
- **ADDED**: Enhanced API documentation

### ⚠️ Breaking Changes

1. **UI Framework**: Complete migration from Fluent UI to Material 3
   - All custom Fluent UI themes and styling will need to be updated
   - NavigationView components replaced with NavigationRail

2. **Localization**: New intl_utils-based system
   - Old localization keys may need updating
   - ARB files now required for translations

3. **Theming**: New Material 3 theming system
   - Custom themes will need to be recreated using Material 3 specifications
   - Color schemes follow Material 3 token system

### 📊 Statistics
- **Lines of Code**: ~2,500 lines (restructured and optimized)
- **File Changes**: 15+ files modified or created
- **New Dependencies**: 3 added, 1 removed
- **Localization**: 50+ translated strings in 2 languages
- **Components**: 20+ Material 3 components implemented

## [1.0.0] - 2024-XX-XX

### Added
- Initial release of Honyomi
- PDF viewer with navigation controls
- Personal dictionary functionality
- Fluent UI design system implementation
- Multi-language support (English/Ukrainian)
- Windows desktop application
- Library management with recent files
- Settings page with theme switching
- About page with app information
- File picker integration for PDF opening
- Context menu for text selection
- Zoom controls (in/out)
- Page navigation (previous/next)
- Local storage for settings and dictionary
- Modern Windows 11-style interface

### Technical
- Flutter 3.35.0 framework
- Fluent UI 4.11.0 design system
- Syncfusion PDF Viewer integration
- Provider state management
- SharedPreferences for persistence
- Cross-platform architecture ready
- MVVM pattern implementation

### Platforms
- ✅ Windows (primary)
- 🔄 Android (ready)
- 🔄 iOS (ready)
- 🔄 Web (ready)

---

## Version History

- **v0.0.2**: Material 3 migration and enhanced localization
- **v0.0.1**: Initial release with Fluent UI

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

---

## Release Notes

### v0.0.1 - Initial Release

This is the first stable release of Honyomi, featuring a complete PDF reading experience designed for language learners.

**Key Highlights:**
- Beautiful Fluent Design interface
- Comprehensive PDF viewing capabilities
- Personal dictionary for vocabulary building
- Multi-language interface support
- Windows-first approach with cross-platform readiness

**What's Next:**
We're planning to expand Honyomi with cloud features, translation integration, and mobile optimization in future releases.

---

*For detailed technical changes, see the git commit history.*
