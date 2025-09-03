// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Honyomi';

  @override
  String get library => 'Library';

  @override
  String get dictionary => 'Dictionary';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get openPdf => 'Open PDF';

  @override
  String get openFile => 'Open File';

  @override
  String get lastOpenedFiles => 'Recently opened files';

  @override
  String get recentFiles => 'Recent Files';

  @override
  String get noRecentFiles => 'No recent files';

  @override
  String get noRecentFilesDescription => 'Open a PDF file to get started';

  @override
  String get libraryDescription => 'Manage your PDF files and recent documents';

  @override
  String get fileNotFound => 'File not found';

  @override
  String get remove => 'Remove';

  @override
  String get previousPage => 'Previous Page';

  @override
  String get nextPage => 'Next Page';

  @override
  String get zoomIn => 'Zoom In';

  @override
  String get zoomOut => 'Zoom Out';

  @override
  String get addBookmark => 'Add Bookmark';

  @override
  String get closePdf => 'Close PDF';

  @override
  String get addWord => 'Add Word';

  @override
  String get editWord => 'Edit Word';

  @override
  String get save => 'Save';

  @override
  String get copy => 'Copy';

  @override
  String get selectAll => 'Select All';

  @override
  String get addToDictionary => 'Add to Dictionary';

  @override
  String get translate => 'Translate';

  @override
  String get delete => 'Delete';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get version => 'Version';

  @override
  String get license => 'License';

  @override
  String get description => 'Description';

  @override
  String get appDescription =>
      'Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.';

  @override
  String get word => 'Word';

  @override
  String get translation => 'Translation';

  @override
  String get enterWord => 'Enter word';

  @override
  String get enterTranslation => 'Enter translation';

  @override
  String get pleaseEnterWord => 'Please enter a word';

  @override
  String get pronunciation => 'Pronunciation';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get wordInformation => 'Word Information';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get wordAdded => 'Word added to dictionary';

  @override
  String get emptyDictionary => 'Your dictionary is empty';

  @override
  String get addFirstWord =>
      'Add your first word to start building your vocabulary';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get english => 'English';

  @override
  String get ukrainian => 'Ukrainian';

  @override
  String get pdfViewerSettings => 'PDF Viewer Settings';

  @override
  String get configurePdfPreferences => 'Configure PDF viewing preferences';

  @override
  String get enableZoom => 'Enable Zoom';

  @override
  String get allowZoomingInPdfViewer => 'Allow zooming in PDF viewer';

  @override
  String get autoSaveBookmarks => 'Auto-save Bookmarks';

  @override
  String get automaticallySaveReadingPosition =>
      'Automatically save reading position';

  @override
  String get builtWith => 'Built with';

  @override
  String get features => 'Features';

  @override
  String get pdfReading => 'PDF Reading';

  @override
  String get pdfReadingDescription =>
      'Open and read PDF documents with smooth navigation';

  @override
  String get personalDictionary => 'Personal Dictionary';

  @override
  String get personalDictionaryDescription =>
      'Build your vocabulary with custom word translations';

  @override
  String get multiLanguageSupport => 'Multi-language Support';

  @override
  String get multiLanguageSupportDescription =>
      'Available in English and Ukrainian';

  @override
  String get material3Design => 'Material 3 Design';

  @override
  String get material3DesignDescription => 'Modern and adaptive user interface';

  @override
  String wordAddedMessage(String word, String translation) {
    return 'Word \'$word\' - \'$translation\' added to dictionary';
  }

  @override
  String get savedWords => 'Saved Words';

  @override
  String get wordDetails => 'Word Details';

  @override
  String get wordType => 'Word Type';

  @override
  String get selectWordType => 'Select word type';

  @override
  String get noun => 'Noun';

  @override
  String get verb => 'Verb';

  @override
  String get adjective => 'Adjective';

  @override
  String get adverb => 'Adverb';

  @override
  String get preposition => 'Preposition';

  @override
  String get conjunction => 'Conjunction';

  @override
  String get interjection => 'Interjection';

  @override
  String get other => 'Other';

  @override
  String get createdAt => 'Created at';

  @override
  String get updatedAt => 'Updated at';

  @override
  String get edit => 'Edit';

  @override
  String get exportDictionary => 'Export Dictionary';

  @override
  String get importDictionary => 'Import Dictionary';

  @override
  String get checkForUpdates => 'Check for Updates';

  @override
  String get aboutApp => 'About App';

  @override
  String get general => 'General';

  @override
  String get dictionaryManagement => 'Dictionary Management';

  @override
  String get bookmarkSaved => 'Bookmark saved';

  @override
  String bookmarkResumed(int page) {
    return 'Resumed from page $page';
  }

  @override
  String get wordCopied => 'Word copied to clipboard';

  @override
  String get textSelected => 'Text selected';

  @override
  String get wordDefinitions => 'Definitions';

  @override
  String get wordTranslations => 'Translations';

  @override
  String get noDefinitionsAvailable => 'No definitions available';

  @override
  String get noTranslationsAvailable => 'No translations available';

  @override
  String get partOfSpeechNoun => 'Noun';

  @override
  String get partOfSpeechVerb => 'Verb';

  @override
  String get partOfSpeechAdjective => 'Adjective';

  @override
  String get partOfSpeechAdverb => 'Adverb';

  @override
  String get partOfSpeechPreposition => 'Preposition';

  @override
  String get partOfSpeechConjunction => 'Conjunction';

  @override
  String get partOfSpeechInterjection => 'Interjection';

  @override
  String get partOfSpeechPronoun => 'Pronoun';

  @override
  String get pronunciationNotAvailable => 'Pronunciation not available';

  @override
  String get addDefinition => 'Add Definition';

  @override
  String get deleteDefinition => 'Delete Definition';

  @override
  String get pleaseAddAtLeastOneDefinition =>
      'Please add at least one definition';

  @override
  String get enterDefinitionInEnglish => 'Enter definition in English';

  @override
  String get enterExampleSentence => 'Enter example sentence';

  @override
  String get enterExampleTranslation => 'Enter example translation';

  @override
  String get optional => 'optional';

  @override
  String get errorSavingWord => 'Error saving word';

  @override
  String get definition => 'Definition';

  @override
  String get example => 'Example';

  @override
  String get exampleTranslation => 'Example Translation';

  @override
  String get partOfSpeech => 'Part of Speech';

  @override
  String get pleaseSelectPartOfSpeech => 'Please select part of speech';

  @override
  String get pleaseEnterTranslation => 'Please enter translation';

  @override
  String get dictionaryExportedWeb =>
      'Dictionary exported! Check your downloads folder.';

  @override
  String get dictionaryExportedDesktop =>
      'Dictionary exported to Documents folder.';

  @override
  String dictionaryImportedSuccess(int wordsCount) {
    return 'Dictionary imported successfully ($wordsCount words)';
  }

  @override
  String get dictionaryEmpty => 'Dictionary is empty';

  @override
  String importFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String exportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get invalidFileFormat =>
      'Invalid file format: expected object with \"words\" property';

  @override
  String get home => 'Home';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String get goodNight => 'Good night';

  @override
  String get wordsToStudy => 'Words to study';

  @override
  String get recentPdfFiles => 'Recent PDF files';

  @override
  String get newWords => 'New words';

  @override
  String get learnedWords => 'Learned words';

  @override
  String get searchWords => 'Search words...';

  @override
  String get allWords => 'All Words';

  @override
  String get noWordsFound => 'No words found';

  @override
  String get noWordsFoundMessage => 'Try adjusting your search query';

  @override
  String get toggleLearned => 'Toggle learned status';

  @override
  String get wordLearned => 'Word learned';

  @override
  String get wordUnlearned => 'Word marked as new';

  @override
  String get searchFiles => 'Search files...';

  @override
  String get isLearned => 'Learned';

  @override
  String get markAsLearned => 'Mark as learned';

  @override
  String get markAsNotLearned => 'Mark as not learned';

  @override
  String learnedAt(String date) {
    return 'Learned at $date';
  }

  @override
  String get wordAlreadyExists => 'Word already exists';

  @override
  String wordAlreadyExistsMessage(String word) {
    return 'The word \'$word\' is already in your dictionary';
  }

  @override
  String get updateChannel => 'Update channel';

  @override
  String get stable => 'Stable';

  @override
  String get beta => 'Beta';

  @override
  String get noWordsToStudy => 'No words to study';

  @override
  String get noPdfFiles => 'No PDF files';

  @override
  String get rename => 'Rename';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get pinnedFiles => 'Pinned files';

  @override
  String get webVersionMessage =>
      'In web version you need to reselect the file. Use the \"Open file\" button.';

  @override
  String get webVersionLibraryInfo =>
      'In web version files are not saved in recent list';

  @override
  String get openPdfFilePrompt => 'Click the button below to open a PDF file';

  @override
  String get readyToStudy => 'Ready to study?';

  @override
  String get totalWords => 'Total words';

  @override
  String get morningMessage => 'Good morning! Ready to learn something new?';

  @override
  String get afternoonMessage => 'Good afternoon! Let\'s continue learning!';

  @override
  String get eveningMessage => 'Good evening! Time for some study!';

  @override
  String get nightMessage => 'Good night! Maybe some light reading?';

  @override
  String get appInformation => 'App Information';

  @override
  String get learnMoreAboutHonyomi => 'Learn more about Honyomi';

  @override
  String get exportDictionaryToFile => 'Export your dictionary to a file';

  @override
  String get importDictionaryFromFile => 'Import dictionary from a file';

  @override
  String get checkForAppUpdates => 'Check for app updates';

  @override
  String get updateAvailable => 'Update available';

  @override
  String get noUpdatesAvailable => 'No updates available';

  @override
  String get youAreUsingLatestVersion => 'You are using the latest version';

  @override
  String get downloadUpdate => 'Download Update';

  @override
  String get checkingForUpdates => 'Checking for updates...';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkTheme => 'Dark theme';

  @override
  String get darkThemeDesc => 'Use dark theme for the app';

  @override
  String get updates => 'Updates';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get updateCheckError =>
      'Failed to check for updates. Please try again later.';

  @override
  String get updateAvailableMessage =>
      'A new version is available for download.';

  @override
  String get appUpToDate => 'You are using the latest version of the app.';

  @override
  String get importExport => 'Import & Export';

  @override
  String get exportWords => 'Export Words';

  @override
  String get importWords => 'Import Words';

  @override
  String get success => 'Success';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Info';

  @override
  String get bookmark => 'Bookmark';

  @override
  String get importSuccessful => 'Import successful';

  @override
  String get exportSuccessful => 'Export successful';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get lightTheme => 'Light theme';

  @override
  String get systemTheme => 'System theme';
}
