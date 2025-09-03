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
}
