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

  /// `Edit Word`
  String get editWord {
    return Intl.message(
      'Edit Word',
      name: 'editWord',
      desc: 'Edit word page title',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: 'Save button', args: []);
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

  /// `Please enter a word`
  String get pleaseEnterWord {
    return Intl.message(
      'Please enter a word',
      name: 'pleaseEnterWord',
      desc: 'Validation message for empty word field',
      args: [],
    );
  }

  /// `Pronunciation`
  String get pronunciation {
    return Intl.message(
      'Pronunciation',
      name: 'pronunciation',
      desc: 'Pronunciation field label',
      args: [],
    );
  }

  /// `Add to favorites`
  String get addToFavorites {
    return Intl.message(
      'Add to favorites',
      name: 'addToFavorites',
      desc: 'Add to favorites label',
      args: [],
    );
  }

  /// `Word Information`
  String get wordInformation {
    return Intl.message(
      'Word Information',
      name: 'wordInformation',
      desc: 'Word information section title',
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

  /// `Word '{word}' - '{translation}' added to dictionary`
  String wordAddedMessage(String word, String translation) {
    return Intl.message(
      'Word \'$word\' - \'$translation\' added to dictionary',
      name: 'wordAddedMessage',
      desc: 'Success message when word is added with word and translation',
      args: [word, translation],
    );
  }

  /// `Saved Words`
  String get savedWords {
    return Intl.message(
      'Saved Words',
      name: 'savedWords',
      desc: 'Title for the list of saved words in the dictionary',
      args: [],
    );
  }

  /// `Word Details`
  String get wordDetails {
    return Intl.message(
      'Word Details',
      name: 'wordDetails',
      desc: 'Word details page title',
      args: [],
    );
  }

  /// `Word Type`
  String get wordType {
    return Intl.message(
      'Word Type',
      name: 'wordType',
      desc: 'Word type field label',
      args: [],
    );
  }

  /// `Select word type`
  String get selectWordType {
    return Intl.message(
      'Select word type',
      name: 'selectWordType',
      desc: 'Word type field hint',
      args: [],
    );
  }

  /// `Noun`
  String get noun {
    return Intl.message('Noun', name: 'noun', desc: 'Noun word type', args: []);
  }

  /// `Verb`
  String get verb {
    return Intl.message('Verb', name: 'verb', desc: 'Verb word type', args: []);
  }

  /// `Adjective`
  String get adjective {
    return Intl.message(
      'Adjective',
      name: 'adjective',
      desc: 'Adjective word type',
      args: [],
    );
  }

  /// `Adverb`
  String get adverb {
    return Intl.message(
      'Adverb',
      name: 'adverb',
      desc: 'Adverb word type',
      args: [],
    );
  }

  /// `Preposition`
  String get preposition {
    return Intl.message(
      'Preposition',
      name: 'preposition',
      desc: 'Preposition word type',
      args: [],
    );
  }

  /// `Conjunction`
  String get conjunction {
    return Intl.message(
      'Conjunction',
      name: 'conjunction',
      desc: 'Conjunction word type',
      args: [],
    );
  }

  /// `Interjection`
  String get interjection {
    return Intl.message(
      'Interjection',
      name: 'interjection',
      desc: 'Interjection word type',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: 'Other word type',
      args: [],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: 'Created at field label',
      args: [],
    );
  }

  /// `Updated at`
  String get updatedAt {
    return Intl.message(
      'Updated at',
      name: 'updatedAt',
      desc: 'Updated at field label',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: 'Edit button', args: []);
  }

  /// `Export Dictionary`
  String get exportDictionary {
    return Intl.message(
      'Export Dictionary',
      name: 'exportDictionary',
      desc: 'Export dictionary button',
      args: [],
    );
  }

  /// `Import Dictionary`
  String get importDictionary {
    return Intl.message(
      'Import Dictionary',
      name: 'importDictionary',
      desc: 'Import dictionary button',
      args: [],
    );
  }

  /// `Check for Updates`
  String get checkForUpdates {
    return Intl.message(
      'Check for Updates',
      name: 'checkForUpdates',
      desc: 'Check for updates button',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: 'About app button',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: 'General settings section',
      args: [],
    );
  }

  /// `Dictionary Management`
  String get dictionaryManagement {
    return Intl.message(
      'Dictionary Management',
      name: 'dictionaryManagement',
      desc: 'Dictionary management settings section',
      args: [],
    );
  }

  /// `Bookmark saved`
  String get bookmarkSaved {
    return Intl.message(
      'Bookmark saved',
      name: 'bookmarkSaved',
      desc: 'Bookmark saved message',
      args: [],
    );
  }

  /// `Resumed from page {page}`
  String bookmarkResumed(int page) {
    return Intl.message(
      'Resumed from page $page',
      name: 'bookmarkResumed',
      desc: 'Bookmark resumed message',
      args: [page],
    );
  }

  /// `Word copied to clipboard`
  String get wordCopied {
    return Intl.message(
      'Word copied to clipboard',
      name: 'wordCopied',
      desc: 'Word copied to clipboard message',
      args: [],
    );
  }

  /// `Text selected`
  String get textSelected {
    return Intl.message(
      'Text selected',
      name: 'textSelected',
      desc: 'Text selected message',
      args: [],
    );
  }

  /// `Definitions`
  String get wordDefinitions {
    return Intl.message(
      'Definitions',
      name: 'wordDefinitions',
      desc: 'Word definitions tab',
      args: [],
    );
  }

  /// `Translations`
  String get wordTranslations {
    return Intl.message(
      'Translations',
      name: 'wordTranslations',
      desc: 'Word translations tab',
      args: [],
    );
  }

  /// `No definitions available`
  String get noDefinitionsAvailable {
    return Intl.message(
      'No definitions available',
      name: 'noDefinitionsAvailable',
      desc: 'No definitions available message',
      args: [],
    );
  }

  /// `No translations available`
  String get noTranslationsAvailable {
    return Intl.message(
      'No translations available',
      name: 'noTranslationsAvailable',
      desc: 'No translations available message',
      args: [],
    );
  }

  /// `Noun`
  String get partOfSpeechNoun {
    return Intl.message(
      'Noun',
      name: 'partOfSpeechNoun',
      desc: 'Noun part of speech',
      args: [],
    );
  }

  /// `Verb`
  String get partOfSpeechVerb {
    return Intl.message(
      'Verb',
      name: 'partOfSpeechVerb',
      desc: 'Verb part of speech',
      args: [],
    );
  }

  /// `Adjective`
  String get partOfSpeechAdjective {
    return Intl.message(
      'Adjective',
      name: 'partOfSpeechAdjective',
      desc: 'Adjective part of speech',
      args: [],
    );
  }

  /// `Adverb`
  String get partOfSpeechAdverb {
    return Intl.message(
      'Adverb',
      name: 'partOfSpeechAdverb',
      desc: 'Adverb part of speech',
      args: [],
    );
  }

  /// `Preposition`
  String get partOfSpeechPreposition {
    return Intl.message(
      'Preposition',
      name: 'partOfSpeechPreposition',
      desc: 'Preposition part of speech',
      args: [],
    );
  }

  /// `Conjunction`
  String get partOfSpeechConjunction {
    return Intl.message(
      'Conjunction',
      name: 'partOfSpeechConjunction',
      desc: 'Conjunction part of speech',
      args: [],
    );
  }

  /// `Interjection`
  String get partOfSpeechInterjection {
    return Intl.message(
      'Interjection',
      name: 'partOfSpeechInterjection',
      desc: 'Interjection part of speech',
      args: [],
    );
  }

  /// `Pronoun`
  String get partOfSpeechPronoun {
    return Intl.message(
      'Pronoun',
      name: 'partOfSpeechPronoun',
      desc: 'Pronoun part of speech',
      args: [],
    );
  }

  /// `Pronunciation not available`
  String get pronunciationNotAvailable {
    return Intl.message(
      'Pronunciation not available',
      name: 'pronunciationNotAvailable',
      desc: 'Pronunciation not available message',
      args: [],
    );
  }

  /// `Add Definition`
  String get addDefinition {
    return Intl.message(
      'Add Definition',
      name: 'addDefinition',
      desc: 'Button to add a new definition',
      args: [],
    );
  }

  /// `Delete Definition`
  String get deleteDefinition {
    return Intl.message(
      'Delete Definition',
      name: 'deleteDefinition',
      desc: 'Button to delete a definition',
      args: [],
    );
  }

  /// `Please add at least one definition`
  String get pleaseAddAtLeastOneDefinition {
    return Intl.message(
      'Please add at least one definition',
      name: 'pleaseAddAtLeastOneDefinition',
      desc: 'Error message when no definitions are provided',
      args: [],
    );
  }

  /// `Enter definition in English`
  String get enterDefinitionInEnglish {
    return Intl.message(
      'Enter definition in English',
      name: 'enterDefinitionInEnglish',
      desc: 'Hint text for definition field',
      args: [],
    );
  }

  /// `Enter example sentence`
  String get enterExampleSentence {
    return Intl.message(
      'Enter example sentence',
      name: 'enterExampleSentence',
      desc: 'Hint text for example field',
      args: [],
    );
  }

  /// `Enter example translation`
  String get enterExampleTranslation {
    return Intl.message(
      'Enter example translation',
      name: 'enterExampleTranslation',
      desc: 'Hint text for example translation field',
      args: [],
    );
  }

  /// `optional`
  String get optional {
    return Intl.message(
      'optional',
      name: 'optional',
      desc: 'Label for optional fields',
      args: [],
    );
  }

  /// `Error saving word`
  String get errorSavingWord {
    return Intl.message(
      'Error saving word',
      name: 'errorSavingWord',
      desc: 'Error message when saving word fails',
      args: [],
    );
  }

  /// `Definition`
  String get definition {
    return Intl.message(
      'Definition',
      name: 'definition',
      desc: 'Definition label',
      args: [],
    );
  }

  /// `Example`
  String get example {
    return Intl.message(
      'Example',
      name: 'example',
      desc: 'Example label',
      args: [],
    );
  }

  /// `Example Translation`
  String get exampleTranslation {
    return Intl.message(
      'Example Translation',
      name: 'exampleTranslation',
      desc: 'Example translation label',
      args: [],
    );
  }

  /// `Part of Speech`
  String get partOfSpeech {
    return Intl.message(
      'Part of Speech',
      name: 'partOfSpeech',
      desc: 'Part of speech label',
      args: [],
    );
  }

  /// `Please select part of speech`
  String get pleaseSelectPartOfSpeech {
    return Intl.message(
      'Please select part of speech',
      name: 'pleaseSelectPartOfSpeech',
      desc: 'Error message when part of speech is not selected',
      args: [],
    );
  }

  /// `Please enter translation`
  String get pleaseEnterTranslation {
    return Intl.message(
      'Please enter translation',
      name: 'pleaseEnterTranslation',
      desc: 'Error message when translation is not provided',
      args: [],
    );
  }

  /// `Dictionary exported! Check your downloads folder.`
  String get dictionaryExportedWeb {
    return Intl.message(
      'Dictionary exported! Check your downloads folder.',
      name: 'dictionaryExportedWeb',
      desc: 'Message shown when dictionary is exported on web',
      args: [],
    );
  }

  /// `Dictionary exported to Documents folder.`
  String get dictionaryExportedDesktop {
    return Intl.message(
      'Dictionary exported to Documents folder.',
      name: 'dictionaryExportedDesktop',
      desc: 'Message shown when dictionary is exported on desktop',
      args: [],
    );
  }

  /// `Dictionary imported successfully ({wordsCount} words)`
  String dictionaryImportedSuccess(int wordsCount) {
    return Intl.message(
      'Dictionary imported successfully ($wordsCount words)',
      name: 'dictionaryImportedSuccess',
      desc: 'Message shown when dictionary is successfully imported',
      args: [wordsCount],
    );
  }

  /// `Dictionary is empty`
  String get dictionaryEmpty {
    return Intl.message(
      'Dictionary is empty',
      name: 'dictionaryEmpty',
      desc: 'Message when trying to export empty dictionary',
      args: [],
    );
  }

  /// `Import failed: {error}`
  String importFailed(String error) {
    return Intl.message(
      'Import failed: $error',
      name: 'importFailed',
      desc: 'Error message when import fails',
      args: [error],
    );
  }

  /// `Export failed: {error}`
  String exportFailed(String error) {
    return Intl.message(
      'Export failed: $error',
      name: 'exportFailed',
      desc: 'Error message when export fails',
      args: [error],
    );
  }

  /// `Invalid file format: expected object with "words" property`
  String get invalidFileFormat {
    return Intl.message(
      'Invalid file format: expected object with "words" property',
      name: 'invalidFileFormat',
      desc: 'Error message for invalid file format',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Home page title',
      args: [],
    );
  }

  /// `Good morning`
  String get goodMorning {
    return Intl.message(
      'Good morning',
      name: 'goodMorning',
      desc: 'Morning greeting',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: 'Afternoon greeting',
      args: [],
    );
  }

  /// `Good evening`
  String get goodEvening {
    return Intl.message(
      'Good evening',
      name: 'goodEvening',
      desc: 'Evening greeting',
      args: [],
    );
  }

  /// `Good night`
  String get goodNight {
    return Intl.message(
      'Good night',
      name: 'goodNight',
      desc: 'Night greeting',
      args: [],
    );
  }

  /// `Words to study`
  String get wordsToStudy {
    return Intl.message(
      'Words to study',
      name: 'wordsToStudy',
      desc: 'Section title for words to study',
      args: [],
    );
  }

  /// `Recent PDF files`
  String get recentPdfFiles {
    return Intl.message(
      'Recent PDF files',
      name: 'recentPdfFiles',
      desc: 'Section title for recent PDF files',
      args: [],
    );
  }

  /// `New words`
  String get newWords {
    return Intl.message(
      'New words',
      name: 'newWords',
      desc: 'Section title for new words',
      args: [],
    );
  }

  /// `Learned words`
  String get learnedWords {
    return Intl.message(
      'Learned words',
      name: 'learnedWords',
      desc: 'Section title for learned words',
      args: [],
    );
  }

  /// `Search words...`
  String get searchWords {
    return Intl.message(
      'Search words...',
      name: 'searchWords',
      desc: 'Hint text for word search',
      args: [],
    );
  }

  /// `All Words`
  String get allWords {
    return Intl.message('All Words', name: 'allWords', desc: '', args: []);
  }

  /// `No words found`
  String get noWordsFound {
    return Intl.message(
      'No words found',
      name: 'noWordsFound',
      desc: '',
      args: [],
    );
  }

  /// `Try adjusting your search query`
  String get noWordsFoundMessage {
    return Intl.message(
      'Try adjusting your search query',
      name: 'noWordsFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Toggle learned status`
  String get toggleLearned {
    return Intl.message(
      'Toggle learned status',
      name: 'toggleLearned',
      desc: '',
      args: [],
    );
  }

  /// `Word learned`
  String get wordLearned {
    return Intl.message(
      'Word learned',
      name: 'wordLearned',
      desc: '',
      args: [],
    );
  }

  /// `Word marked as new`
  String get wordUnlearned {
    return Intl.message(
      'Word marked as new',
      name: 'wordUnlearned',
      desc: '',
      args: [],
    );
  }

  /// `Search files...`
  String get searchFiles {
    return Intl.message(
      'Search files...',
      name: 'searchFiles',
      desc: 'Hint text for file search',
      args: [],
    );
  }

  /// `Learned`
  String get isLearned {
    return Intl.message(
      'Learned',
      name: 'isLearned',
      desc: 'Label for learned status',
      args: [],
    );
  }

  /// `Mark as learned`
  String get markAsLearned {
    return Intl.message(
      'Mark as learned',
      name: 'markAsLearned',
      desc: 'Action to mark word as learned',
      args: [],
    );
  }

  /// `Mark as not learned`
  String get markAsNotLearned {
    return Intl.message(
      'Mark as not learned',
      name: 'markAsNotLearned',
      desc: 'Action to mark word as not learned',
      args: [],
    );
  }

  /// `Learned at {date}`
  String learnedAt(String date) {
    return Intl.message(
      'Learned at $date',
      name: 'learnedAt',
      desc: 'Shows when word was learned',
      args: [date],
    );
  }

  /// `Word already exists`
  String get wordAlreadyExists {
    return Intl.message(
      'Word already exists',
      name: 'wordAlreadyExists',
      desc: 'Warning when word already exists',
      args: [],
    );
  }

  /// `The word '{word}' is already in your dictionary`
  String wordAlreadyExistsMessage(String word) {
    return Intl.message(
      'The word \'$word\' is already in your dictionary',
      name: 'wordAlreadyExistsMessage',
      desc: 'Warning message when word already exists',
      args: [word],
    );
  }

  /// `Update channel`
  String get updateChannel {
    return Intl.message(
      'Update channel',
      name: 'updateChannel',
      desc: 'Update channel setting',
      args: [],
    );
  }

  /// `Stable`
  String get stable {
    return Intl.message(
      'Stable',
      name: 'stable',
      desc: 'Stable update channel',
      args: [],
    );
  }

  /// `Beta`
  String get beta {
    return Intl.message(
      'Beta',
      name: 'beta',
      desc: 'Beta update channel',
      args: [],
    );
  }

  /// `No words to study`
  String get noWordsToStudy {
    return Intl.message(
      'No words to study',
      name: 'noWordsToStudy',
      desc: 'Message when no words to study',
      args: [],
    );
  }

  /// `No PDF files`
  String get noPdfFiles {
    return Intl.message(
      'No PDF files',
      name: 'noPdfFiles',
      desc: 'Message when no PDF files',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: 'Action to rename',
      args: [],
    );
  }

  /// `Pin`
  String get pin {
    return Intl.message(
      'Pin',
      name: 'pin',
      desc: 'Action to pin file',
      args: [],
    );
  }

  /// `Unpin`
  String get unpin {
    return Intl.message(
      'Unpin',
      name: 'unpin',
      desc: 'Action to unpin file',
      args: [],
    );
  }

  /// `Pinned files`
  String get pinnedFiles {
    return Intl.message(
      'Pinned files',
      name: 'pinnedFiles',
      desc: 'Pinned files section',
      args: [],
    );
  }

  /// `In web version you need to reselect the file. Use the "Open file" button.`
  String get webVersionMessage {
    return Intl.message(
      'In web version you need to reselect the file. Use the "Open file" button.',
      name: 'webVersionMessage',
      desc: 'Message for web version about file reselection',
      args: [],
    );
  }

  /// `In web version files are not saved in recent list`
  String get webVersionLibraryInfo {
    return Intl.message(
      'In web version files are not saved in recent list',
      name: 'webVersionLibraryInfo',
      desc: 'Information about web version library limitations',
      args: [],
    );
  }

  /// `Click the button below to open a PDF file`
  String get openPdfFilePrompt {
    return Intl.message(
      'Click the button below to open a PDF file',
      name: 'openPdfFilePrompt',
      desc: 'Prompt to open PDF file',
      args: [],
    );
  }

  /// `Ready to study?`
  String get readyToStudy {
    return Intl.message(
      'Ready to study?',
      name: 'readyToStudy',
      desc: 'Greeting phrase about readiness to study',
      args: [],
    );
  }

  /// `Total words`
  String get totalWords {
    return Intl.message(
      'Total words',
      name: 'totalWords',
      desc: 'Label for total words count',
      args: [],
    );
  }

  /// `Good morning! Ready to learn something new?`
  String get morningMessage {
    return Intl.message(
      'Good morning! Ready to learn something new?',
      name: 'morningMessage',
      desc: 'Morning greeting message',
      args: [],
    );
  }

  /// `Good afternoon! Let's continue learning!`
  String get afternoonMessage {
    return Intl.message(
      'Good afternoon! Let\'s continue learning!',
      name: 'afternoonMessage',
      desc: 'Afternoon greeting message',
      args: [],
    );
  }

  /// `Good evening! Time for some study!`
  String get eveningMessage {
    return Intl.message(
      'Good evening! Time for some study!',
      name: 'eveningMessage',
      desc: 'Evening greeting message',
      args: [],
    );
  }

  /// `Good night! Maybe some light reading?`
  String get nightMessage {
    return Intl.message(
      'Good night! Maybe some light reading?',
      name: 'nightMessage',
      desc: 'Night greeting message',
      args: [],
    );
  }

  /// `App Information`
  String get appInformation {
    return Intl.message(
      'App Information',
      name: 'appInformation',
      desc: 'App information section title',
      args: [],
    );
  }

  /// `Learn more about Honyomi`
  String get learnMoreAboutHonyomi {
    return Intl.message(
      'Learn more about Honyomi',
      name: 'learnMoreAboutHonyomi',
      desc: 'Subtitle for about app option',
      args: [],
    );
  }

  /// `Export your dictionary to a file`
  String get exportDictionaryToFile {
    return Intl.message(
      'Export your dictionary to a file',
      name: 'exportDictionaryToFile',
      desc: 'Subtitle for export dictionary option',
      args: [],
    );
  }

  /// `Import dictionary from a file`
  String get importDictionaryFromFile {
    return Intl.message(
      'Import dictionary from a file',
      name: 'importDictionaryFromFile',
      desc: 'Subtitle for import dictionary option',
      args: [],
    );
  }

  /// `Check for app updates`
  String get checkForAppUpdates {
    return Intl.message(
      'Check for app updates',
      name: 'checkForAppUpdates',
      desc: 'Subtitle for check updates option',
      args: [],
    );
  }

  /// `Update available`
  String get updateAvailable {
    return Intl.message(
      'Update available',
      name: 'updateAvailable',
      desc: 'Title when update is available',
      args: [],
    );
  }

  /// `No updates available`
  String get noUpdatesAvailable {
    return Intl.message(
      'No updates available',
      name: 'noUpdatesAvailable',
      desc: 'Message when no updates are available',
      args: [],
    );
  }

  /// `You are using the latest version`
  String get youAreUsingLatestVersion {
    return Intl.message(
      'You are using the latest version',
      name: 'youAreUsingLatestVersion',
      desc: 'Message when using latest version',
      args: [],
    );
  }

  /// `Download Update`
  String get downloadUpdate {
    return Intl.message(
      'Download Update',
      name: 'downloadUpdate',
      desc: 'Button to download update',
      args: [],
    );
  }

  /// `Checking for updates...`
  String get checkingForUpdates {
    return Intl.message(
      'Checking for updates...',
      name: 'checkingForUpdates',
      desc: 'Message while checking for updates',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: 'Appearance settings section title',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: 'Dark theme switch title',
      args: [],
    );
  }

  /// `Use dark theme for the app`
  String get darkThemeDesc {
    return Intl.message(
      'Use dark theme for the app',
      name: 'darkThemeDesc',
      desc: 'Dark theme switch description',
      args: [],
    );
  }

  /// `Updates`
  String get updates {
    return Intl.message(
      'Updates',
      name: 'updates',
      desc: 'Updates section title',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: 'OK button', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: 'Error dialog title',
      args: [],
    );
  }

  /// `Failed to check for updates. Please try again later.`
  String get updateCheckError {
    return Intl.message(
      'Failed to check for updates. Please try again later.',
      name: 'updateCheckError',
      desc: 'Error message when update check fails',
      args: [],
    );
  }

  /// `A new version is available for download.`
  String get updateAvailableMessage {
    return Intl.message(
      'A new version is available for download.',
      name: 'updateAvailableMessage',
      desc: 'Message when update is available',
      args: [],
    );
  }

  /// `You are using the latest version of the app.`
  String get appUpToDate {
    return Intl.message(
      'You are using the latest version of the app.',
      name: 'appUpToDate',
      desc: 'Message when app is up to date',
      args: [],
    );
  }

  /// `Import & Export`
  String get importExport {
    return Intl.message(
      'Import & Export',
      name: 'importExport',
      desc: 'Import & Export section title',
      args: [],
    );
  }

  /// `Export Words`
  String get exportWords {
    return Intl.message(
      'Export Words',
      name: 'exportWords',
      desc: 'Export words button',
      args: [],
    );
  }

  /// `Import Words`
  String get importWords {
    return Intl.message(
      'Import Words',
      name: 'importWords',
      desc: 'Import words button',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: 'Generic success title',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: 'Generic warning title',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: 'Generic info title',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark {
    return Intl.message(
      'Bookmark',
      name: 'bookmark',
      desc: 'Bookmark title',
      args: [],
    );
  }

  /// `Import successful`
  String get importSuccessful {
    return Intl.message(
      'Import successful',
      name: 'importSuccessful',
      desc: 'Shown when import finishes successfully',
      args: [],
    );
  }

  /// `Export successful`
  String get exportSuccessful {
    return Intl.message(
      'Export successful',
      name: 'exportSuccessful',
      desc: 'Shown when export finishes successfully',
      args: [],
    );
  }

  /// `Theme mode`
  String get themeMode {
    return Intl.message(
      'Theme mode',
      name: 'themeMode',
      desc: 'Theme mode selection label',
      args: [],
    );
  }

  /// `Light theme`
  String get lightTheme {
    return Intl.message(
      'Light theme',
      name: 'lightTheme',
      desc: 'Light theme option',
      args: [],
    );
  }

  /// `System theme`
  String get systemTheme {
    return Intl.message(
      'System theme',
      name: 'systemTheme',
      desc: 'Follow system theme option',
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
