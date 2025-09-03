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

  static String m4(date) => "Learned at ${date}";

  static String m5(word, translation) =>
      "Word \'${word}\' - \'${translation}\' added to dictionary";

  static String m6(word) =>
      "The word \'${word}\' is already in your dictionary";

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
    "afternoonMessage": MessageLookupByLibrary.simpleMessage(
      "Good afternoon! Let\'s continue learning!",
    ),
    "allWords": MessageLookupByLibrary.simpleMessage("All Words"),
    "allowZoomingInPdfViewer": MessageLookupByLibrary.simpleMessage(
      "Allow zooming in PDF viewer",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Honyomi is a smart language learning reader that helps you read PDF documents while building your vocabulary. Perfect for language learners who want to improve their reading skills while studying.",
    ),
    "appInformation": MessageLookupByLibrary.simpleMessage("App Information"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Honyomi"),
    "appUpToDate": MessageLookupByLibrary.simpleMessage(
      "You are using the latest version of the app.",
    ),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "autoSaveBookmarks": MessageLookupByLibrary.simpleMessage(
      "Auto-save Bookmarks",
    ),
    "automaticallySaveReadingPosition": MessageLookupByLibrary.simpleMessage(
      "Automatically save reading position",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("Beta"),
    "bookmark": MessageLookupByLibrary.simpleMessage("Bookmark"),
    "bookmarkResumed": m0,
    "bookmarkSaved": MessageLookupByLibrary.simpleMessage("Bookmark saved"),
    "builtWith": MessageLookupByLibrary.simpleMessage("Built with"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "checkForAppUpdates": MessageLookupByLibrary.simpleMessage(
      "Check for app updates",
    ),
    "checkForUpdates": MessageLookupByLibrary.simpleMessage(
      "Check for Updates",
    ),
    "checkingForUpdates": MessageLookupByLibrary.simpleMessage(
      "Checking for updates...",
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
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
    "darkThemeDesc": MessageLookupByLibrary.simpleMessage(
      "Use dark theme for the app",
    ),
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
    "downloadUpdate": MessageLookupByLibrary.simpleMessage("Download Update"),
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
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorSavingWord": MessageLookupByLibrary.simpleMessage(
      "Error saving word",
    ),
    "eveningMessage": MessageLookupByLibrary.simpleMessage(
      "Good evening! Time for some study!",
    ),
    "example": MessageLookupByLibrary.simpleMessage("Example"),
    "exampleTranslation": MessageLookupByLibrary.simpleMessage(
      "Example Translation",
    ),
    "exportDictionary": MessageLookupByLibrary.simpleMessage(
      "Export Dictionary",
    ),
    "exportDictionaryToFile": MessageLookupByLibrary.simpleMessage(
      "Export your dictionary to a file",
    ),
    "exportFailed": m2,
    "exportSuccessful": MessageLookupByLibrary.simpleMessage(
      "Export successful",
    ),
    "exportWords": MessageLookupByLibrary.simpleMessage("Export Words"),
    "features": MessageLookupByLibrary.simpleMessage("Features"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("File not found"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Good afternoon"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Good evening"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Good morning"),
    "goodNight": MessageLookupByLibrary.simpleMessage("Good night"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "importDictionary": MessageLookupByLibrary.simpleMessage(
      "Import Dictionary",
    ),
    "importDictionaryFromFile": MessageLookupByLibrary.simpleMessage(
      "Import dictionary from a file",
    ),
    "importExport": MessageLookupByLibrary.simpleMessage("Import & Export"),
    "importFailed": m3,
    "importSuccessful": MessageLookupByLibrary.simpleMessage(
      "Import successful",
    ),
    "importWords": MessageLookupByLibrary.simpleMessage("Import Words"),
    "info": MessageLookupByLibrary.simpleMessage("Info"),
    "interjection": MessageLookupByLibrary.simpleMessage("Interjection"),
    "invalidFileFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid file format: expected object with \"words\" property",
    ),
    "isLearned": MessageLookupByLibrary.simpleMessage("Learned"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastOpenedFiles": MessageLookupByLibrary.simpleMessage(
      "Recently opened files",
    ),
    "learnMoreAboutHonyomi": MessageLookupByLibrary.simpleMessage(
      "Learn more about Honyomi",
    ),
    "learnedAt": m4,
    "learnedWords": MessageLookupByLibrary.simpleMessage("Learned words"),
    "library": MessageLookupByLibrary.simpleMessage("Library"),
    "libraryDescription": MessageLookupByLibrary.simpleMessage(
      "Manage your PDF files and recent documents",
    ),
    "license": MessageLookupByLibrary.simpleMessage("License"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "lightTheme": MessageLookupByLibrary.simpleMessage("Light theme"),
    "markAsLearned": MessageLookupByLibrary.simpleMessage("Mark as learned"),
    "markAsNotLearned": MessageLookupByLibrary.simpleMessage(
      "Mark as not learned",
    ),
    "material3Design": MessageLookupByLibrary.simpleMessage(
      "Material 3 Design",
    ),
    "material3DesignDescription": MessageLookupByLibrary.simpleMessage(
      "Modern and adaptive user interface",
    ),
    "morningMessage": MessageLookupByLibrary.simpleMessage(
      "Good morning! Ready to learn something new?",
    ),
    "multiLanguageSupport": MessageLookupByLibrary.simpleMessage(
      "Multi-language Support",
    ),
    "multiLanguageSupportDescription": MessageLookupByLibrary.simpleMessage(
      "Available in English and Ukrainian",
    ),
    "newWords": MessageLookupByLibrary.simpleMessage("New words"),
    "nextPage": MessageLookupByLibrary.simpleMessage("Next Page"),
    "nightMessage": MessageLookupByLibrary.simpleMessage(
      "Good night! Maybe some light reading?",
    ),
    "noDefinitionsAvailable": MessageLookupByLibrary.simpleMessage(
      "No definitions available",
    ),
    "noPdfFiles": MessageLookupByLibrary.simpleMessage("No PDF files"),
    "noRecentFiles": MessageLookupByLibrary.simpleMessage("No recent files"),
    "noRecentFilesDescription": MessageLookupByLibrary.simpleMessage(
      "Open a PDF file to get started",
    ),
    "noTranslationsAvailable": MessageLookupByLibrary.simpleMessage(
      "No translations available",
    ),
    "noUpdatesAvailable": MessageLookupByLibrary.simpleMessage(
      "No updates available",
    ),
    "noWordsFound": MessageLookupByLibrary.simpleMessage("No words found"),
    "noWordsFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Try adjusting your search query",
    ),
    "noWordsToStudy": MessageLookupByLibrary.simpleMessage("No words to study"),
    "noun": MessageLookupByLibrary.simpleMessage("Noun"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "openFile": MessageLookupByLibrary.simpleMessage("Open File"),
    "openPdf": MessageLookupByLibrary.simpleMessage("Open PDF"),
    "openPdfFilePrompt": MessageLookupByLibrary.simpleMessage(
      "Click the button below to open a PDF file",
    ),
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
    "pin": MessageLookupByLibrary.simpleMessage("Pin"),
    "pinnedFiles": MessageLookupByLibrary.simpleMessage("Pinned files"),
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
    "readyToStudy": MessageLookupByLibrary.simpleMessage("Ready to study?"),
    "recentFiles": MessageLookupByLibrary.simpleMessage("Recent Files"),
    "recentPdfFiles": MessageLookupByLibrary.simpleMessage("Recent PDF files"),
    "remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "rename": MessageLookupByLibrary.simpleMessage("Rename"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "savedWords": MessageLookupByLibrary.simpleMessage("Saved Words"),
    "searchFiles": MessageLookupByLibrary.simpleMessage("Search files..."),
    "searchWords": MessageLookupByLibrary.simpleMessage("Search words..."),
    "selectAll": MessageLookupByLibrary.simpleMessage("Select All"),
    "selectWordType": MessageLookupByLibrary.simpleMessage("Select word type"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "stable": MessageLookupByLibrary.simpleMessage("Stable"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "systemTheme": MessageLookupByLibrary.simpleMessage("System theme"),
    "textSelected": MessageLookupByLibrary.simpleMessage("Text selected"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Theme mode"),
    "toggleLearned": MessageLookupByLibrary.simpleMessage(
      "Toggle learned status",
    ),
    "totalWords": MessageLookupByLibrary.simpleMessage("Total words"),
    "translate": MessageLookupByLibrary.simpleMessage("Translate"),
    "translation": MessageLookupByLibrary.simpleMessage("Translation"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Ukrainian"),
    "unpin": MessageLookupByLibrary.simpleMessage("Unpin"),
    "updateAvailable": MessageLookupByLibrary.simpleMessage("Update available"),
    "updateAvailableMessage": MessageLookupByLibrary.simpleMessage(
      "A new version is available for download.",
    ),
    "updateChannel": MessageLookupByLibrary.simpleMessage("Update channel"),
    "updateCheckError": MessageLookupByLibrary.simpleMessage(
      "Failed to check for updates. Please try again later.",
    ),
    "updatedAt": MessageLookupByLibrary.simpleMessage("Updated at"),
    "updates": MessageLookupByLibrary.simpleMessage("Updates"),
    "verb": MessageLookupByLibrary.simpleMessage("Verb"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "warning": MessageLookupByLibrary.simpleMessage("Warning"),
    "webVersionLibraryInfo": MessageLookupByLibrary.simpleMessage(
      "In web version files are not saved in recent list",
    ),
    "webVersionMessage": MessageLookupByLibrary.simpleMessage(
      "In web version you need to reselect the file. Use the \"Open file\" button.",
    ),
    "word": MessageLookupByLibrary.simpleMessage("Word"),
    "wordAdded": MessageLookupByLibrary.simpleMessage(
      "Word added to dictionary",
    ),
    "wordAddedMessage": m5,
    "wordAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Word already exists",
    ),
    "wordAlreadyExistsMessage": m6,
    "wordCopied": MessageLookupByLibrary.simpleMessage(
      "Word copied to clipboard",
    ),
    "wordDefinitions": MessageLookupByLibrary.simpleMessage("Definitions"),
    "wordDetails": MessageLookupByLibrary.simpleMessage("Word Details"),
    "wordInformation": MessageLookupByLibrary.simpleMessage("Word Information"),
    "wordLearned": MessageLookupByLibrary.simpleMessage("Word learned"),
    "wordTranslations": MessageLookupByLibrary.simpleMessage("Translations"),
    "wordType": MessageLookupByLibrary.simpleMessage("Word Type"),
    "wordUnlearned": MessageLookupByLibrary.simpleMessage("Word marked as new"),
    "wordsToStudy": MessageLookupByLibrary.simpleMessage("Words to study"),
    "youAreUsingLatestVersion": MessageLookupByLibrary.simpleMessage(
      "You are using the latest version",
    ),
    "zoomIn": MessageLookupByLibrary.simpleMessage("Zoom In"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("Zoom Out"),
  };
}
