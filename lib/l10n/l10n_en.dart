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
}
