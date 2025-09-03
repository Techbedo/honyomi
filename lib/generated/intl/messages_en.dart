// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(page) => "Resumed from page ${page}";

  static String m1(wordsCount) =>
      "Dictionary imported successfully (${wordsCount} words)";

  static String m2(error) => "Export failed: ${error}";

  static String m3(error) => "Import failed: ${error}";

  static String m4(word, translation) =>
      "Word \'${word}\' - \'${translation}\' added to dictionary";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "aboutApp": MessageLookupByLibrary.simpleMessage("About App"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addBookmark": MessageLookupByLibrary.simpleMessage("Add Bookmark"),
    "addDefinition": MessageLookupByLibrary.simpleMessage("Add Definition"),
    "addFirstWord": MessageLookupByLibrary.simpleMessage(
      "Add your first word to start building your vocabulary",
    ),
    "addToDictionary": MessageLookupByLibrary.simpleMessage(
      "Add to Dictionary",
    ),
    "addToFavorites": MessageLookupByLibrary.simpleMessage("Add to favorites"),
    "addWord": MessageLookupByLibrary.simpleMessage("Add Word"),
    "adjective": MessageLookupByLibrary.simpleMessage("Adjective"),
    "adverb": MessageLookupByLibrary.simpleMessage("Adverb"),
    "allowZoomingInPdfViewer": MessageLookupByLibrary.simpleMessage(
      "Allow zooming in PDF viewer",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Honyomi"),
    "autoSaveBookmarks": MessageLookupByLibrary.simpleMessage(
      "Auto-save Bookmarks",
    ),
    "automaticallySaveReadingPosition": MessageLookupByLibrary.simpleMessage(
      "Automatically save reading position",
    ),
    "bookmarkResumed": m0,
    "bookmarkSaved": MessageLookupByLibrary.simpleMessage("Bookmark saved"),
    "builtWith": MessageLookupByLibrary.simpleMessage("Built with"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "checkForUpdates": MessageLookupByLibrary.simpleMessage(
      "Check for Updates",
    ),
    "closePdf": MessageLookupByLibrary.simpleMessage("Close PDF"),
    "configurePdfPreferences": MessageLookupByLibrary.simpleMessage(
      "Configure PDF viewing preferences",
    ),
    "conjunction": MessageLookupByLibrary.simpleMessage("Conjunction"),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "createdAt": MessageLookupByLibrary.simpleMessage("Created at"),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "definition": MessageLookupByLibrary.simpleMessage("Definition"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDefinition": MessageLookupByLibrary.simpleMessage(
      "Delete Definition",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "dictionary": MessageLookupByLibrary.simpleMessage("Dictionary"),
    "dictionaryEmpty": MessageLookupByLibrary.simpleMessage(
      "Dictionary is empty",
    ),
    "dictionaryExportedDesktop": MessageLookupByLibrary.simpleMessage(
      "Dictionary exported to Documents folder.",
    ),
    "dictionaryExportedWeb": MessageLookupByLibrary.simpleMessage(
      "Dictionary exported! Check your downloads folder.",
    ),
    "dictionaryImportedSuccess": m1,
    "dictionaryManagement": MessageLookupByLibrary.simpleMessage(
      "Dictionary Management",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editWord": MessageLookupByLibrary.simpleMessage("Edit Word"),
    "emptyDictionary": MessageLookupByLibrary.simpleMessage(
      "Your dictionary is empty",
    ),
    "enableZoom": MessageLookupByLibrary.simpleMessage("Enable Zoom"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterDefinitionInEnglish": MessageLookupByLibrary.simpleMessage(
      "Enter definition in English",
    ),
    "enterExampleSentence": MessageLookupByLibrary.simpleMessage(
      "Enter example sentence",
    ),
    "enterExampleTranslation": MessageLookupByLibrary.simpleMessage(
      "Enter example translation",
    ),
    "enterTranslation": MessageLookupByLibrary.simpleMessage(
      "Enter translation",
    ),
    "enterWord": MessageLookupByLibrary.simpleMessage("Enter word"),
    "errorSavingWord": MessageLookupByLibrary.simpleMessage(
      "Error saving word",
    ),
    "example": MessageLookupByLibrary.simpleMessage("Example"),
    "exampleTranslation": MessageLookupByLibrary.simpleMessage(
      "Example Translation",
    ),
    "exportDictionary": MessageLookupByLibrary.simpleMessage(
      "Export Dictionary",
    ),
    "exportFailed": m2,
    "features": MessageLookupByLibrary.simpleMessage("Features"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("File not found"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "importDictionary": MessageLookupByLibrary.simpleMessage(
      "Import Dictionary",
    ),
    "importFailed": m3,
    "interjection": MessageLookupByLibrary.simpleMessage("Interjection"),
    "invalidFileFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid file format: expected object with \"words\" property",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastOpenedFiles": MessageLookupByLibrary.simpleMessage(
      "Recently opened files",
    ),
    "library": MessageLookupByLibrary.simpleMessage("Library"),
    "libraryDescription": MessageLookupByLibrary.simpleMessage(
      "Manage your PDF files and recent documents",
    ),
    "license": MessageLookupByLibrary.simpleMessage("License"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "material3Design": MessageLookupByLibrary.simpleMessage(
      "Material 3 Design",
    ),
    "material3DesignDescription": MessageLookupByLibrary.simpleMessage(
      "Modern and adaptive user interface",
    ),
    "multiLanguageSupport": MessageLookupByLibrary.simpleMessage(
      "Multi-language Support",
    ),
    "multiLanguageSupportDescription": MessageLookupByLibrary.simpleMessage(
      "Available in English and Ukrainian",
    ),
    "nextPage": MessageLookupByLibrary.simpleMessage("Next Page"),
    "noDefinitionsAvailable": MessageLookupByLibrary.simpleMessage(
      "No definitions available",
    ),
    "noRecentFiles": MessageLookupByLibrary.simpleMessage("No recent files"),
    "noRecentFilesDescription": MessageLookupByLibrary.simpleMessage(
      "Open a PDF file to get started",
    ),
    "noTranslationsAvailable": MessageLookupByLibrary.simpleMessage(
      "No translations available",
    ),
    "noun": MessageLookupByLibrary.simpleMessage("Noun"),
    "openFile": MessageLookupByLibrary.simpleMessage("Open File"),
    "openPdf": MessageLookupByLibrary.simpleMessage("Open PDF"),
    "optional": MessageLookupByLibrary.simpleMessage("optional"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "partOfSpeech": MessageLookupByLibrary.simpleMessage("Part of Speech"),
    "partOfSpeechAdjective": MessageLookupByLibrary.simpleMessage("Adjective"),
    "partOfSpeechAdverb": MessageLookupByLibrary.simpleMessage("Adverb"),
    "partOfSpeechConjunction": MessageLookupByLibrary.simpleMessage(
      "Conjunction",
    ),
    "partOfSpeechInterjection": MessageLookupByLibrary.simpleMessage(
      "Interjection",
    ),
    "partOfSpeechNoun": MessageLookupByLibrary.simpleMessage("Noun"),
    "partOfSpeechPreposition": MessageLookupByLibrary.simpleMessage(
      "Preposition",
    ),
    "partOfSpeechPronoun": MessageLookupByLibrary.simpleMessage("Pronoun"),
    "partOfSpeechVerb": MessageLookupByLibrary.simpleMessage("Verb"),
    "pdfReading": MessageLookupByLibrary.simpleMessage("PDF Reading"),
    "pdfReadingDescription": MessageLookupByLibrary.simpleMessage(
      "Open and read PDF documents with smooth navigation",
    ),
    "pdfViewerSettings": MessageLookupByLibrary.simpleMessage(
      "PDF Viewer Settings",
    ),
    "personalDictionary": MessageLookupByLibrary.simpleMessage(
      "Personal Dictionary",
    ),
    "personalDictionaryDescription": MessageLookupByLibrary.simpleMessage(
      "Build your vocabulary with custom word translations",
    ),
    "pleaseAddAtLeastOneDefinition": MessageLookupByLibrary.simpleMessage(
      "Please add at least one definition",
    ),
    "pleaseEnterTranslation": MessageLookupByLibrary.simpleMessage(
      "Please enter translation",
    ),
    "pleaseEnterWord": MessageLookupByLibrary.simpleMessage(
      "Please enter a word",
    ),
    "pleaseSelectPartOfSpeech": MessageLookupByLibrary.simpleMessage(
      "Please select part of speech",
    ),
    "preposition": MessageLookupByLibrary.simpleMessage("Preposition"),
    "previousPage": MessageLookupByLibrary.simpleMessage("Previous Page"),
    "pronunciation": MessageLookupByLibrary.simpleMessage("Pronunciation"),
    "pronunciationNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Pronunciation not available",
    ),
    "recentFiles": MessageLookupByLibrary.simpleMessage("Recent Files"),
    "remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "savedWords": MessageLookupByLibrary.simpleMessage("Saved Words"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Select All"),
    "selectWordType": MessageLookupByLibrary.simpleMessage("Select word type"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "textSelected": MessageLookupByLibrary.simpleMessage("Text selected"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "translate": MessageLookupByLibrary.simpleMessage("Translate"),
    "translation": MessageLookupByLibrary.simpleMessage("Translation"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Ukrainian"),
    "updatedAt": MessageLookupByLibrary.simpleMessage("Updated at"),
    "verb": MessageLookupByLibrary.simpleMessage("Verb"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "word": MessageLookupByLibrary.simpleMessage("Word"),
    "wordAdded": MessageLookupByLibrary.simpleMessage(
      "Word added to dictionary",
    ),
    "wordAddedMessage": m4,
    "wordCopied": MessageLookupByLibrary.simpleMessage(
      "Word copied to clipboard",
    ),
    "wordDefinitions": MessageLookupByLibrary.simpleMessage("Definitions"),
    "wordDetails": MessageLookupByLibrary.simpleMessage("Word Details"),
    "wordInformation": MessageLookupByLibrary.simpleMessage("Word Information"),
    "wordTranslations": MessageLookupByLibrary.simpleMessage("Translations"),
    "wordType": MessageLookupByLibrary.simpleMessage("Word Type"),
    "zoomIn": MessageLookupByLibrary.simpleMessage("Zoom In"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("Zoom Out"),
  };
}
