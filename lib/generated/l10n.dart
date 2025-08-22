// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Honyomi`
  String get appTitle {
    return Intl.message(
      'Honyomi',
      name: 'appTitle',
      desc: 'The application title',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message(
      'Library',
      name: 'library',
      desc: 'Library page title',
      args: [],
    );
  }

  /// `Dictionary`
  String get dictionary {
    return Intl.message(
      'Dictionary',
      name: 'dictionary',
      desc: 'Dictionary page title',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings page title',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'About page title',
      args: [],
    );
  }

  /// `Open PDF`
  String get openPdf {
    return Intl.message(
      'Open PDF',
      name: 'openPdf',
      desc: 'Button to open PDF file',
      args: [],
    );
  }

  /// `Open File`
  String get openFile {
    return Intl.message(
      'Open File',
      name: 'openFile',
      desc: 'Button to open file',
      args: [],
    );
  }

  /// `Recently opened files`
  String get lastOpenedFiles {
    return Intl.message(
      'Recently opened files',
      name: 'lastOpenedFiles',
      desc: 'Section title for recently opened files',
      args: [],
    );
  }

  /// `Recent Files`
  String get recentFiles {
    return Intl.message(
      'Recent Files',
      name: 'recentFiles',
      desc: 'Recent files section',
      args: [],
    );
  }

  /// `No recent files`
  String get noRecentFiles {
    return Intl.message(
      'No recent files',
      name: 'noRecentFiles',
      desc: 'Message when no recent files are available',
      args: [],
    );
  }

  /// `Open a PDF file to get started`
  String get noRecentFilesDescription {
    return Intl.message(
      'Open a PDF file to get started',
      name: 'noRecentFilesDescription',
      desc: 'Description for empty recent files',
      args: [],
    );
  }

  /// `Manage your PDF files and recent documents`
  String get libraryDescription {
    return Intl.message(
      'Manage your PDF files and recent documents',
      name: 'libraryDescription',
      desc: 'Description for library page',
      args: [],
    );
  }

  /// `File not found`
  String get fileNotFound {
    return Intl.message(
      'File not found',
      name: 'fileNotFound',
      desc: 'Error message when file is not found',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: 'Remove button text',
      args: [],
    );
  }

  /// `Previous Page`
  String get previousPage {
    return Intl.message(
      'Previous Page',
      name: 'previousPage',
      desc: 'Button to go to previous page',
      args: [],
    );
  }

  /// `Next Page`
  String get nextPage {
    return Intl.message(
      'Next Page',
      name: 'nextPage',
      desc: 'Button to go to next page',
      args: [],
    );
  }

  /// `Zoom In`
  String get zoomIn {
    return Intl.message(
      'Zoom In',
      name: 'zoomIn',
      desc: 'Button to zoom in',
      args: [],
    );
  }

  /// `Zoom Out`
  String get zoomOut {
    return Intl.message(
      'Zoom Out',
      name: 'zoomOut',
      desc: 'Button to zoom out',
      args: [],
    );
  }

  /// `Add Bookmark`
  String get addBookmark {
    return Intl.message(
      'Add Bookmark',
      name: 'addBookmark',
      desc: 'Button to add bookmark',
      args: [],
    );
  }

  /// `Close PDF`
  String get closePdf {
    return Intl.message(
      'Close PDF',
      name: 'closePdf',
      desc: 'Button to close PDF',
      args: [],
    );
  }

  /// `Add Word`
  String get addWord {
    return Intl.message(
      'Add Word',
      name: 'addWord',
      desc: 'Button to add word to dictionary',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: 'Copy button', args: []);
  }

  /// `Select All`
  String get selectAll {
    return Intl.message(
      'Select All',
      name: 'selectAll',
      desc: 'Select all button',
      args: [],
    );
  }

  /// `Add to Dictionary`
  String get addToDictionary {
    return Intl.message(
      'Add to Dictionary',
      name: 'addToDictionary',
      desc: 'Add to dictionary button',
      args: [],
    );
  }

  /// `Translate`
  String get translate {
    return Intl.message(
      'Translate',
      name: 'translate',
      desc: 'Translate button',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Delete button',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Theme setting',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language setting',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: 'Dark mode setting',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: 'Version label',
      args: [],
    );
  }

  /// `License`
  String get license {
    return Intl.message(
      'License',
      name: 'license',
      desc: 'License label',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: 'Description label',
      args: [],
    );
  }

  /// `Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.`
  String get appDescription {
    return Intl.message(
      'Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.',
      name: 'appDescription',
      desc: 'Application description',
      args: [],
    );
  }

  /// `Word`
  String get word {
    return Intl.message('Word', name: 'word', desc: 'Word label', args: []);
  }

  /// `Translation`
  String get translation {
    return Intl.message(
      'Translation',
      name: 'translation',
      desc: 'Translation label',
      args: [],
    );
  }

  /// `Enter word`
  String get enterWord {
    return Intl.message(
      'Enter word',
      name: 'enterWord',
      desc: 'Placeholder for word input',
      args: [],
    );
  }

  /// `Enter translation`
  String get enterTranslation {
    return Intl.message(
      'Enter translation',
      name: 'enterTranslation',
      desc: 'Placeholder for translation input',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: 'Add button', args: []);
  }

  /// `Word added to dictionary`
  String get wordAdded {
    return Intl.message(
      'Word added to dictionary',
      name: 'wordAdded',
      desc: 'Success message when word is added',
      args: [],
    );
  }

  /// `Your dictionary is empty`
  String get emptyDictionary {
    return Intl.message(
      'Your dictionary is empty',
      name: 'emptyDictionary',
      desc: 'Message when dictionary is empty',
      args: [],
    );
  }

  /// `Add your first word to start building your vocabulary`
  String get addFirstWord {
    return Intl.message(
      'Add your first word to start building your vocabulary',
      name: 'addFirstWord',
      desc: 'Description for empty dictionary',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: 'System theme option',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: 'Light theme option',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: 'Dark theme option',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'English language option',
      args: [],
    );
  }

  /// `Ukrainian`
  String get ukrainian {
    return Intl.message(
      'Ukrainian',
      name: 'ukrainian',
      desc: 'Ukrainian language option',
      args: [],
    );
  }

  /// `PDF Viewer Settings`
  String get pdfViewerSettings {
    return Intl.message(
      'PDF Viewer Settings',
      name: 'pdfViewerSettings',
      desc: 'PDF viewer settings section title',
      args: [],
    );
  }

  /// `Configure PDF viewing preferences`
  String get configurePdfPreferences {
    return Intl.message(
      'Configure PDF viewing preferences',
      name: 'configurePdfPreferences',
      desc: 'PDF viewer settings description',
      args: [],
    );
  }

  /// `Enable Zoom`
  String get enableZoom {
    return Intl.message(
      'Enable Zoom',
      name: 'enableZoom',
      desc: 'Enable zoom setting',
      args: [],
    );
  }

  /// `Allow zooming in PDF viewer`
  String get allowZoomingInPdfViewer {
    return Intl.message(
      'Allow zooming in PDF viewer',
      name: 'allowZoomingInPdfViewer',
      desc: 'Zoom setting description',
      args: [],
    );
  }

  /// `Auto-save Bookmarks`
  String get autoSaveBookmarks {
    return Intl.message(
      'Auto-save Bookmarks',
      name: 'autoSaveBookmarks',
      desc: 'Auto-save bookmarks setting',
      args: [],
    );
  }

  /// `Automatically save reading position`
  String get automaticallySaveReadingPosition {
    return Intl.message(
      'Automatically save reading position',
      name: 'automaticallySaveReadingPosition',
      desc: 'Bookmark setting description',
      args: [],
    );
  }

  /// `Built with`
  String get builtWith {
    return Intl.message(
      'Built with',
      name: 'builtWith',
      desc: 'Built with label',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: 'Features section title',
      args: [],
    );
  }

  /// `PDF Reading`
  String get pdfReading {
    return Intl.message(
      'PDF Reading',
      name: 'pdfReading',
      desc: 'PDF reading feature title',
      args: [],
    );
  }

  /// `Open and read PDF documents with smooth navigation`
  String get pdfReadingDescription {
    return Intl.message(
      'Open and read PDF documents with smooth navigation',
      name: 'pdfReadingDescription',
      desc: 'PDF reading feature description',
      args: [],
    );
  }

  /// `Personal Dictionary`
  String get personalDictionary {
    return Intl.message(
      'Personal Dictionary',
      name: 'personalDictionary',
      desc: 'Personal dictionary feature title',
      args: [],
    );
  }

  /// `Build your vocabulary with custom word translations`
  String get personalDictionaryDescription {
    return Intl.message(
      'Build your vocabulary with custom word translations',
      name: 'personalDictionaryDescription',
      desc: 'Personal dictionary feature description',
      args: [],
    );
  }

  /// `Multi-language Support`
  String get multiLanguageSupport {
    return Intl.message(
      'Multi-language Support',
      name: 'multiLanguageSupport',
      desc: 'Multi-language support feature title',
      args: [],
    );
  }

  /// `Available in English and Ukrainian`
  String get multiLanguageSupportDescription {
    return Intl.message(
      'Available in English and Ukrainian',
      name: 'multiLanguageSupportDescription',
      desc: 'Multi-language support feature description',
      args: [],
    );
  }

  /// `Material 3 Design`
  String get material3Design {
    return Intl.message(
      'Material 3 Design',
      name: 'material3Design',
      desc: 'Material 3 design feature title',
      args: [],
    );
  }

  /// `Modern and adaptive user interface`
  String get material3DesignDescription {
    return Intl.message(
      'Modern and adaptive user interface',
      name: 'material3DesignDescription',
      desc: 'Material 3 design feature description',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
