import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Honyomi'**
  String get appTitle;

  /// Library page title
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Dictionary page title
  ///
  /// In en, this message translates to:
  /// **'Dictionary'**
  String get dictionary;

  /// Settings page title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// About page title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Button to open PDF file
  ///
  /// In en, this message translates to:
  /// **'Open PDF'**
  String get openPdf;

  /// Button to open file
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get openFile;

  /// Section title for recently opened files
  ///
  /// In en, this message translates to:
  /// **'Recently opened files'**
  String get lastOpenedFiles;

  /// Recent files section
  ///
  /// In en, this message translates to:
  /// **'Recent Files'**
  String get recentFiles;

  /// Message when no recent files are available
  ///
  /// In en, this message translates to:
  /// **'No recent files'**
  String get noRecentFiles;

  /// Description for empty recent files
  ///
  /// In en, this message translates to:
  /// **'Open a PDF file to get started'**
  String get noRecentFilesDescription;

  /// Description for library page
  ///
  /// In en, this message translates to:
  /// **'Manage your PDF files and recent documents'**
  String get libraryDescription;

  /// Error message when file is not found
  ///
  /// In en, this message translates to:
  /// **'File not found'**
  String get fileNotFound;

  /// Remove button text
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Button to go to previous page
  ///
  /// In en, this message translates to:
  /// **'Previous Page'**
  String get previousPage;

  /// Button to go to next page
  ///
  /// In en, this message translates to:
  /// **'Next Page'**
  String get nextPage;

  /// Button to zoom in
  ///
  /// In en, this message translates to:
  /// **'Zoom In'**
  String get zoomIn;

  /// Button to zoom out
  ///
  /// In en, this message translates to:
  /// **'Zoom Out'**
  String get zoomOut;

  /// Button to add bookmark
  ///
  /// In en, this message translates to:
  /// **'Add Bookmark'**
  String get addBookmark;

  /// Button to close PDF
  ///
  /// In en, this message translates to:
  /// **'Close PDF'**
  String get closePdf;

  /// Button to add word to dictionary
  ///
  /// In en, this message translates to:
  /// **'Add Word'**
  String get addWord;

  /// Copy button
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Select all button
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// Add to dictionary button
  ///
  /// In en, this message translates to:
  /// **'Add to Dictionary'**
  String get addToDictionary;

  /// Translate button
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// Delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Theme setting
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Dark mode setting
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// License label
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// Description label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Application description
  ///
  /// In en, this message translates to:
  /// **'Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.'**
  String get appDescription;

  /// Word label
  ///
  /// In en, this message translates to:
  /// **'Word'**
  String get word;

  /// Translation label
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// Placeholder for word input
  ///
  /// In en, this message translates to:
  /// **'Enter word'**
  String get enterWord;

  /// Placeholder for translation input
  ///
  /// In en, this message translates to:
  /// **'Enter translation'**
  String get enterTranslation;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Add button
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Success message when word is added
  ///
  /// In en, this message translates to:
  /// **'Word added to dictionary'**
  String get wordAdded;

  /// Message when dictionary is empty
  ///
  /// In en, this message translates to:
  /// **'Your dictionary is empty'**
  String get emptyDictionary;

  /// Description for empty dictionary
  ///
  /// In en, this message translates to:
  /// **'Add your first word to start building your vocabulary'**
  String get addFirstWord;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Ukrainian language option
  ///
  /// In en, this message translates to:
  /// **'Ukrainian'**
  String get ukrainian;

  /// PDF viewer settings section title
  ///
  /// In en, this message translates to:
  /// **'PDF Viewer Settings'**
  String get pdfViewerSettings;

  /// PDF viewer settings description
  ///
  /// In en, this message translates to:
  /// **'Configure PDF viewing preferences'**
  String get configurePdfPreferences;

  /// Enable zoom setting
  ///
  /// In en, this message translates to:
  /// **'Enable Zoom'**
  String get enableZoom;

  /// Zoom setting description
  ///
  /// In en, this message translates to:
  /// **'Allow zooming in PDF viewer'**
  String get allowZoomingInPdfViewer;

  /// Auto-save bookmarks setting
  ///
  /// In en, this message translates to:
  /// **'Auto-save Bookmarks'**
  String get autoSaveBookmarks;

  /// Bookmark setting description
  ///
  /// In en, this message translates to:
  /// **'Automatically save reading position'**
  String get automaticallySaveReadingPosition;

  /// Built with label
  ///
  /// In en, this message translates to:
  /// **'Built with'**
  String get builtWith;

  /// Features section title
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// PDF reading feature title
  ///
  /// In en, this message translates to:
  /// **'PDF Reading'**
  String get pdfReading;

  /// PDF reading feature description
  ///
  /// In en, this message translates to:
  /// **'Open and read PDF documents with smooth navigation'**
  String get pdfReadingDescription;

  /// Personal dictionary feature title
  ///
  /// In en, this message translates to:
  /// **'Personal Dictionary'**
  String get personalDictionary;

  /// Personal dictionary feature description
  ///
  /// In en, this message translates to:
  /// **'Build your vocabulary with custom word translations'**
  String get personalDictionaryDescription;

  /// Multi-language support feature title
  ///
  /// In en, this message translates to:
  /// **'Multi-language Support'**
  String get multiLanguageSupport;

  /// Multi-language support feature description
  ///
  /// In en, this message translates to:
  /// **'Available in English and Ukrainian'**
  String get multiLanguageSupportDescription;

  /// Material 3 design feature title
  ///
  /// In en, this message translates to:
  /// **'Material 3 Design'**
  String get material3Design;

  /// Material 3 design feature description
  ///
  /// In en, this message translates to:
  /// **'Modern and adaptive user interface'**
  String get material3DesignDescription;

  /// Success message when word is added with word and translation
  ///
  /// In en, this message translates to:
  /// **'Word \'{word}\' - \'{translation}\' added to dictionary'**
  String wordAddedMessage(String word, String translation);

  /// Title for the list of saved words in the dictionary
  ///
  /// In en, this message translates to:
  /// **'Saved Words'**
  String get savedWords;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
