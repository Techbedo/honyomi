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

  /// Edit word page title
  ///
  /// In en, this message translates to:
  /// **'Edit Word'**
  String get editWord;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

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

  /// Validation message for empty word field
  ///
  /// In en, this message translates to:
  /// **'Please enter a word'**
  String get pleaseEnterWord;

  /// Pronunciation field label
  ///
  /// In en, this message translates to:
  /// **'Pronunciation'**
  String get pronunciation;

  /// Add to favorites label
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// Word information section title
  ///
  /// In en, this message translates to:
  /// **'Word Information'**
  String get wordInformation;

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

  /// Word details page title
  ///
  /// In en, this message translates to:
  /// **'Word Details'**
  String get wordDetails;

  /// Word type field label
  ///
  /// In en, this message translates to:
  /// **'Word Type'**
  String get wordType;

  /// Word type field hint
  ///
  /// In en, this message translates to:
  /// **'Select word type'**
  String get selectWordType;

  /// Noun word type
  ///
  /// In en, this message translates to:
  /// **'Noun'**
  String get noun;

  /// Verb word type
  ///
  /// In en, this message translates to:
  /// **'Verb'**
  String get verb;

  /// Adjective word type
  ///
  /// In en, this message translates to:
  /// **'Adjective'**
  String get adjective;

  /// Adverb word type
  ///
  /// In en, this message translates to:
  /// **'Adverb'**
  String get adverb;

  /// Preposition word type
  ///
  /// In en, this message translates to:
  /// **'Preposition'**
  String get preposition;

  /// Conjunction word type
  ///
  /// In en, this message translates to:
  /// **'Conjunction'**
  String get conjunction;

  /// Interjection word type
  ///
  /// In en, this message translates to:
  /// **'Interjection'**
  String get interjection;

  /// Other word type
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Created at field label
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get createdAt;

  /// Updated at field label
  ///
  /// In en, this message translates to:
  /// **'Updated at'**
  String get updatedAt;

  /// Edit button
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Export dictionary button
  ///
  /// In en, this message translates to:
  /// **'Export Dictionary'**
  String get exportDictionary;

  /// Import dictionary button
  ///
  /// In en, this message translates to:
  /// **'Import Dictionary'**
  String get importDictionary;

  /// Check for updates button
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkForUpdates;

  /// About app button
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// General settings section
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// Dictionary management settings section
  ///
  /// In en, this message translates to:
  /// **'Dictionary Management'**
  String get dictionaryManagement;

  /// Bookmark saved message
  ///
  /// In en, this message translates to:
  /// **'Bookmark saved'**
  String get bookmarkSaved;

  /// Bookmark resumed message
  ///
  /// In en, this message translates to:
  /// **'Resumed from page {page}'**
  String bookmarkResumed(int page);

  /// Word copied to clipboard message
  ///
  /// In en, this message translates to:
  /// **'Word copied to clipboard'**
  String get wordCopied;

  /// Text selected message
  ///
  /// In en, this message translates to:
  /// **'Text selected'**
  String get textSelected;

  /// Word definitions tab
  ///
  /// In en, this message translates to:
  /// **'Definitions'**
  String get wordDefinitions;

  /// Word translations tab
  ///
  /// In en, this message translates to:
  /// **'Translations'**
  String get wordTranslations;

  /// No definitions available message
  ///
  /// In en, this message translates to:
  /// **'No definitions available'**
  String get noDefinitionsAvailable;

  /// No translations available message
  ///
  /// In en, this message translates to:
  /// **'No translations available'**
  String get noTranslationsAvailable;

  /// Noun part of speech
  ///
  /// In en, this message translates to:
  /// **'Noun'**
  String get partOfSpeechNoun;

  /// Verb part of speech
  ///
  /// In en, this message translates to:
  /// **'Verb'**
  String get partOfSpeechVerb;

  /// Adjective part of speech
  ///
  /// In en, this message translates to:
  /// **'Adjective'**
  String get partOfSpeechAdjective;

  /// Adverb part of speech
  ///
  /// In en, this message translates to:
  /// **'Adverb'**
  String get partOfSpeechAdverb;

  /// Preposition part of speech
  ///
  /// In en, this message translates to:
  /// **'Preposition'**
  String get partOfSpeechPreposition;

  /// Conjunction part of speech
  ///
  /// In en, this message translates to:
  /// **'Conjunction'**
  String get partOfSpeechConjunction;

  /// Interjection part of speech
  ///
  /// In en, this message translates to:
  /// **'Interjection'**
  String get partOfSpeechInterjection;

  /// Pronoun part of speech
  ///
  /// In en, this message translates to:
  /// **'Pronoun'**
  String get partOfSpeechPronoun;

  /// Pronunciation not available message
  ///
  /// In en, this message translates to:
  /// **'Pronunciation not available'**
  String get pronunciationNotAvailable;

  /// Button to add a new definition
  ///
  /// In en, this message translates to:
  /// **'Add Definition'**
  String get addDefinition;

  /// Button to delete a definition
  ///
  /// In en, this message translates to:
  /// **'Delete Definition'**
  String get deleteDefinition;

  /// Error message when no definitions are provided
  ///
  /// In en, this message translates to:
  /// **'Please add at least one definition'**
  String get pleaseAddAtLeastOneDefinition;

  /// Hint text for definition field
  ///
  /// In en, this message translates to:
  /// **'Enter definition in English'**
  String get enterDefinitionInEnglish;

  /// Hint text for example field
  ///
  /// In en, this message translates to:
  /// **'Enter example sentence'**
  String get enterExampleSentence;

  /// Hint text for example translation field
  ///
  /// In en, this message translates to:
  /// **'Enter example translation'**
  String get enterExampleTranslation;

  /// Label for optional fields
  ///
  /// In en, this message translates to:
  /// **'optional'**
  String get optional;

  /// Error message when saving word fails
  ///
  /// In en, this message translates to:
  /// **'Error saving word'**
  String get errorSavingWord;

  /// Definition label
  ///
  /// In en, this message translates to:
  /// **'Definition'**
  String get definition;

  /// Example label
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get example;

  /// Example translation label
  ///
  /// In en, this message translates to:
  /// **'Example Translation'**
  String get exampleTranslation;

  /// Part of speech label
  ///
  /// In en, this message translates to:
  /// **'Part of Speech'**
  String get partOfSpeech;

  /// Error message when part of speech is not selected
  ///
  /// In en, this message translates to:
  /// **'Please select part of speech'**
  String get pleaseSelectPartOfSpeech;

  /// Error message when translation is not provided
  ///
  /// In en, this message translates to:
  /// **'Please enter translation'**
  String get pleaseEnterTranslation;

  /// Message shown when dictionary is exported on web
  ///
  /// In en, this message translates to:
  /// **'Dictionary exported! Check your downloads folder.'**
  String get dictionaryExportedWeb;

  /// Message shown when dictionary is exported on desktop
  ///
  /// In en, this message translates to:
  /// **'Dictionary exported to Documents folder.'**
  String get dictionaryExportedDesktop;

  /// Message shown when dictionary is successfully imported
  ///
  /// In en, this message translates to:
  /// **'Dictionary imported successfully ({wordsCount} words)'**
  String dictionaryImportedSuccess(int wordsCount);

  /// Message when trying to export empty dictionary
  ///
  /// In en, this message translates to:
  /// **'Dictionary is empty'**
  String get dictionaryEmpty;

  /// Error message when import fails
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String importFailed(String error);

  /// Error message when export fails
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String exportFailed(String error);

  /// Error message for invalid file format
  ///
  /// In en, this message translates to:
  /// **'Invalid file format: expected object with \"words\" property'**
  String get invalidFileFormat;

  /// Home page title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// Afternoon greeting
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get goodAfternoon;

  /// Evening greeting
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get goodEvening;

  /// Night greeting
  ///
  /// In en, this message translates to:
  /// **'Good night'**
  String get goodNight;

  /// Section title for words to study
  ///
  /// In en, this message translates to:
  /// **'Words to study'**
  String get wordsToStudy;

  /// Section title for recent PDF files
  ///
  /// In en, this message translates to:
  /// **'Recent PDF files'**
  String get recentPdfFiles;

  /// Section title for new words
  ///
  /// In en, this message translates to:
  /// **'New words'**
  String get newWords;

  /// Section title for learned words
  ///
  /// In en, this message translates to:
  /// **'Learned words'**
  String get learnedWords;

  /// Hint text for word search
  ///
  /// In en, this message translates to:
  /// **'Search words...'**
  String get searchWords;

  /// No description provided for @allWords.
  ///
  /// In en, this message translates to:
  /// **'All Words'**
  String get allWords;

  /// No description provided for @noWordsFound.
  ///
  /// In en, this message translates to:
  /// **'No words found'**
  String get noWordsFound;

  /// No description provided for @noWordsFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search query'**
  String get noWordsFoundMessage;

  /// No description provided for @toggleLearned.
  ///
  /// In en, this message translates to:
  /// **'Toggle learned status'**
  String get toggleLearned;

  /// No description provided for @wordLearned.
  ///
  /// In en, this message translates to:
  /// **'Word learned'**
  String get wordLearned;

  /// No description provided for @wordUnlearned.
  ///
  /// In en, this message translates to:
  /// **'Word marked as new'**
  String get wordUnlearned;

  /// Hint text for file search
  ///
  /// In en, this message translates to:
  /// **'Search files...'**
  String get searchFiles;

  /// Label for learned status
  ///
  /// In en, this message translates to:
  /// **'Learned'**
  String get isLearned;

  /// Action to mark word as learned
  ///
  /// In en, this message translates to:
  /// **'Mark as learned'**
  String get markAsLearned;

  /// Action to mark word as not learned
  ///
  /// In en, this message translates to:
  /// **'Mark as not learned'**
  String get markAsNotLearned;

  /// Shows when word was learned
  ///
  /// In en, this message translates to:
  /// **'Learned at {date}'**
  String learnedAt(String date);

  /// Warning when word already exists
  ///
  /// In en, this message translates to:
  /// **'Word already exists'**
  String get wordAlreadyExists;

  /// Warning message when word already exists
  ///
  /// In en, this message translates to:
  /// **'The word \'{word}\' is already in your dictionary'**
  String wordAlreadyExistsMessage(String word);

  /// Update channel setting
  ///
  /// In en, this message translates to:
  /// **'Update channel'**
  String get updateChannel;

  /// Stable update channel
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get stable;

  /// Beta update channel
  ///
  /// In en, this message translates to:
  /// **'Beta'**
  String get beta;

  /// Message when no words to study
  ///
  /// In en, this message translates to:
  /// **'No words to study'**
  String get noWordsToStudy;

  /// Message when no PDF files
  ///
  /// In en, this message translates to:
  /// **'No PDF files'**
  String get noPdfFiles;

  /// Action to rename
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// Action to pin file
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// Action to unpin file
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// Pinned files section
  ///
  /// In en, this message translates to:
  /// **'Pinned files'**
  String get pinnedFiles;

  /// Message for web version about file reselection
  ///
  /// In en, this message translates to:
  /// **'In web version you need to reselect the file. Use the \"Open file\" button.'**
  String get webVersionMessage;

  /// Information about web version library limitations
  ///
  /// In en, this message translates to:
  /// **'In web version files are not saved in recent list'**
  String get webVersionLibraryInfo;

  /// Prompt to open PDF file
  ///
  /// In en, this message translates to:
  /// **'Click the button below to open a PDF file'**
  String get openPdfFilePrompt;

  /// Greeting phrase about readiness to study
  ///
  /// In en, this message translates to:
  /// **'Ready to study?'**
  String get readyToStudy;

  /// Label for total words count
  ///
  /// In en, this message translates to:
  /// **'Total words'**
  String get totalWords;

  /// Morning greeting message
  ///
  /// In en, this message translates to:
  /// **'Good morning! Ready to learn something new?'**
  String get morningMessage;

  /// Afternoon greeting message
  ///
  /// In en, this message translates to:
  /// **'Good afternoon! Let\'s continue learning!'**
  String get afternoonMessage;

  /// Evening greeting message
  ///
  /// In en, this message translates to:
  /// **'Good evening! Time for some study!'**
  String get eveningMessage;

  /// Night greeting message
  ///
  /// In en, this message translates to:
  /// **'Good night! Maybe some light reading?'**
  String get nightMessage;

  /// App information section title
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInformation;

  /// Subtitle for about app option
  ///
  /// In en, this message translates to:
  /// **'Learn more about Honyomi'**
  String get learnMoreAboutHonyomi;

  /// Subtitle for export dictionary option
  ///
  /// In en, this message translates to:
  /// **'Export your dictionary to a file'**
  String get exportDictionaryToFile;

  /// Subtitle for import dictionary option
  ///
  /// In en, this message translates to:
  /// **'Import dictionary from a file'**
  String get importDictionaryFromFile;

  /// Subtitle for check updates option
  ///
  /// In en, this message translates to:
  /// **'Check for app updates'**
  String get checkForAppUpdates;

  /// Title when update is available
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get updateAvailable;

  /// Message when no updates are available
  ///
  /// In en, this message translates to:
  /// **'No updates available'**
  String get noUpdatesAvailable;

  /// Message when using latest version
  ///
  /// In en, this message translates to:
  /// **'You are using the latest version'**
  String get youAreUsingLatestVersion;

  /// Button to download update
  ///
  /// In en, this message translates to:
  /// **'Download Update'**
  String get downloadUpdate;

  /// Message while checking for updates
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get checkingForUpdates;

  /// Appearance settings section title
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Dark theme switch title
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get darkTheme;

  /// Dark theme switch description
  ///
  /// In en, this message translates to:
  /// **'Use dark theme for the app'**
  String get darkThemeDesc;

  /// Updates section title
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updates;

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Error dialog title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Error message when update check fails
  ///
  /// In en, this message translates to:
  /// **'Failed to check for updates. Please try again later.'**
  String get updateCheckError;

  /// Message when update is available
  ///
  /// In en, this message translates to:
  /// **'A new version is available for download.'**
  String get updateAvailableMessage;

  /// Message when app is up to date
  ///
  /// In en, this message translates to:
  /// **'You are using the latest version of the app.'**
  String get appUpToDate;

  /// Import & Export section title
  ///
  /// In en, this message translates to:
  /// **'Import & Export'**
  String get importExport;

  /// Export words button
  ///
  /// In en, this message translates to:
  /// **'Export Words'**
  String get exportWords;

  /// Import words button
  ///
  /// In en, this message translates to:
  /// **'Import Words'**
  String get importWords;

  /// Generic success title
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Generic warning title
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// Generic info title
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Bookmark title
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// Shown when import finishes successfully
  ///
  /// In en, this message translates to:
  /// **'Import successful'**
  String get importSuccessful;

  /// Shown when export finishes successfully
  ///
  /// In en, this message translates to:
  /// **'Export successful'**
  String get exportSuccessful;

  /// Theme mode selection label
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get lightTheme;

  /// Follow system theme option
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get systemTheme;
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
