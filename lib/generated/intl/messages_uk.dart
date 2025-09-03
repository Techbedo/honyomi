// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(page) => "Відновлено з сторінки ${page}";

  static String m1(wordsCount) =>
      "Словник успішно імпортовано (${wordsCount} слів)";

  static String m2(error) => "Експорт не вдався: ${error}";

  static String m3(error) => "Імпорт не вдався: ${error}";

  static String m4(date) => "Вивчено ${date}";

  static String m5(word, translation) =>
      "Слово \'${word}\' - \'${translation}\' додано до словника";

  static String m6(word) => "Слово \'${word}\' вже є у вашому словнику";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Про застосунок"),
    "aboutApp": MessageLookupByLibrary.simpleMessage("Про програму"),
    "add": MessageLookupByLibrary.simpleMessage("Додати"),
    "addBookmark": MessageLookupByLibrary.simpleMessage("Додати закладку"),
    "addDefinition": MessageLookupByLibrary.simpleMessage("Додати визначення"),
    "addFirstWord": MessageLookupByLibrary.simpleMessage(
      "Додайте ваше перше слово щоб почати поповнювати словниковий запас",
    ),
    "addToDictionary": MessageLookupByLibrary.simpleMessage(
      "Додати до словника",
    ),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Додати до улюблених",
    ),
    "addWord": MessageLookupByLibrary.simpleMessage("Додати слово"),
    "adjective": MessageLookupByLibrary.simpleMessage("Прикметник"),
    "adverb": MessageLookupByLibrary.simpleMessage("Прислівник"),
    "afternoonMessage": MessageLookupByLibrary.simpleMessage(
      "Доброго дня! Продовжимо навчання!",
    ),
    "allWords": MessageLookupByLibrary.simpleMessage("Усі слова"),
    "allowZoomingInPdfViewer": MessageLookupByLibrary.simpleMessage(
      "Дозволити масштабування в PDF переглядачі",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Хоньомі  це розумний читач для вивчення мов, який допомагає читати PDF документи та поповнювати словниковий запас. Ідеально підходить для тих, хто вивчає мови та хоче покращити навички читання під час навчання.",
    ),
    "appInformation": MessageLookupByLibrary.simpleMessage(
      "Інформація про додаток",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Хоньомі"),
    "appUpToDate": MessageLookupByLibrary.simpleMessage(
      "Ви використовуєте найновішу версію додатку.",
    ),
    "appearance": MessageLookupByLibrary.simpleMessage("Зовнішній вигляд"),
    "autoSaveBookmarks": MessageLookupByLibrary.simpleMessage(
      "Автозбереження закладок",
    ),
    "automaticallySaveReadingPosition": MessageLookupByLibrary.simpleMessage(
      "Автоматично зберігати позицію читання",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("Тестовий"),
    "bookmark": MessageLookupByLibrary.simpleMessage("Закладка"),
    "bookmarkResumed": m0,
    "bookmarkSaved": MessageLookupByLibrary.simpleMessage("Закладку збережено"),
    "builtWith": MessageLookupByLibrary.simpleMessage("Розроблено з"),
    "cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
    "checkForAppUpdates": MessageLookupByLibrary.simpleMessage(
      "Перевірте наявність оновлень додатку",
    ),
    "checkForUpdates": MessageLookupByLibrary.simpleMessage(
      "Перевірити оновлення",
    ),
    "checkingForUpdates": MessageLookupByLibrary.simpleMessage(
      "Перевірка оновлень...",
    ),
    "closePdf": MessageLookupByLibrary.simpleMessage("Закрити PDF"),
    "configurePdfPreferences": MessageLookupByLibrary.simpleMessage(
      "Налаштуйте параметри перегляду PDF",
    ),
    "conjunction": MessageLookupByLibrary.simpleMessage("Сполучник"),
    "copy": MessageLookupByLibrary.simpleMessage("Копіювати"),
    "createdAt": MessageLookupByLibrary.simpleMessage("Створено"),
    "dark": MessageLookupByLibrary.simpleMessage("Темна"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Темна тема"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Темна тема"),
    "darkThemeDesc": MessageLookupByLibrary.simpleMessage(
      "Використовувати темну тему для додатку",
    ),
    "definition": MessageLookupByLibrary.simpleMessage("Визначення"),
    "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
    "deleteDefinition": MessageLookupByLibrary.simpleMessage(
      "Видалити визначення",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Опис"),
    "dictionary": MessageLookupByLibrary.simpleMessage("Словник"),
    "dictionaryEmpty": MessageLookupByLibrary.simpleMessage("Словник пустий"),
    "dictionaryExportedDesktop": MessageLookupByLibrary.simpleMessage(
      "Словник експортовано до папки Документи.",
    ),
    "dictionaryExportedWeb": MessageLookupByLibrary.simpleMessage(
      "Словник експортовано! Перевірте папку завантажень.",
    ),
    "dictionaryImportedSuccess": m1,
    "dictionaryManagement": MessageLookupByLibrary.simpleMessage(
      "Керування словником",
    ),
    "downloadUpdate": MessageLookupByLibrary.simpleMessage(
      "Завантажити оновлення",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Редагувати"),
    "editWord": MessageLookupByLibrary.simpleMessage("Редагувати слово"),
    "emptyDictionary": MessageLookupByLibrary.simpleMessage(
      "Ваш словник порожній",
    ),
    "enableZoom": MessageLookupByLibrary.simpleMessage(
      "Увімкнути масштабування",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterDefinitionInEnglish": MessageLookupByLibrary.simpleMessage(
      "Введіть визначення англійською",
    ),
    "enterExampleSentence": MessageLookupByLibrary.simpleMessage(
      "Введіть приклад речення",
    ),
    "enterExampleTranslation": MessageLookupByLibrary.simpleMessage(
      "Введіть переклад прикладу",
    ),
    "enterTranslation": MessageLookupByLibrary.simpleMessage(
      "Введіть переклад",
    ),
    "enterWord": MessageLookupByLibrary.simpleMessage("Введіть слово"),
    "error": MessageLookupByLibrary.simpleMessage("Помилка"),
    "errorSavingWord": MessageLookupByLibrary.simpleMessage(
      "Помилка збереження слова",
    ),
    "eveningMessage": MessageLookupByLibrary.simpleMessage(
      "Доброго вечора! Час для навчання!",
    ),
    "example": MessageLookupByLibrary.simpleMessage("Приклад"),
    "exampleTranslation": MessageLookupByLibrary.simpleMessage(
      "Переклад прикладу",
    ),
    "exportDictionary": MessageLookupByLibrary.simpleMessage(
      "Експорт словника",
    ),
    "exportDictionaryToFile": MessageLookupByLibrary.simpleMessage(
      "Експортуйте свій словник у файл",
    ),
    "exportFailed": m2,
    "exportSuccessful": MessageLookupByLibrary.simpleMessage(
      "Експорт успішний",
    ),
    "exportWords": MessageLookupByLibrary.simpleMessage("Експорт слів"),
    "features": MessageLookupByLibrary.simpleMessage("Функції"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("Файл не знайдено"),
    "general": MessageLookupByLibrary.simpleMessage("Загальні"),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Доброго дня"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Доброго вечора"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Доброго ранку"),
    "goodNight": MessageLookupByLibrary.simpleMessage("Доброї ночі"),
    "home": MessageLookupByLibrary.simpleMessage("Головна"),
    "importDictionary": MessageLookupByLibrary.simpleMessage("Імпорт словника"),
    "importDictionaryFromFile": MessageLookupByLibrary.simpleMessage(
      "Імпортуйте словник з файлу",
    ),
    "importExport": MessageLookupByLibrary.simpleMessage("Імпорт і експорт"),
    "importFailed": m3,
    "importSuccessful": MessageLookupByLibrary.simpleMessage("Імпорт успішний"),
    "importWords": MessageLookupByLibrary.simpleMessage("Імпорт слів"),
    "info": MessageLookupByLibrary.simpleMessage("Інфо"),
    "interjection": MessageLookupByLibrary.simpleMessage("Вигук"),
    "invalidFileFormat": MessageLookupByLibrary.simpleMessage(
      "Неправильний формат файлу: очікується об\'єкт з властивістю \"words\"",
    ),
    "isLearned": MessageLookupByLibrary.simpleMessage("Вивчено"),
    "language": MessageLookupByLibrary.simpleMessage("Мова"),
    "lastOpenedFiles": MessageLookupByLibrary.simpleMessage(
      "Нещодавно відкриті файли",
    ),
    "learnMoreAboutHonyomi": MessageLookupByLibrary.simpleMessage(
      "Дізнайтеся більше про Хоньомі",
    ),
    "learnedAt": m4,
    "learnedWords": MessageLookupByLibrary.simpleMessage("Вивчені слова"),
    "library": MessageLookupByLibrary.simpleMessage("Бібліотека"),
    "libraryDescription": MessageLookupByLibrary.simpleMessage(
      "Керуйте вашими PDF файлами та останніми документами",
    ),
    "license": MessageLookupByLibrary.simpleMessage("Ліцензія"),
    "light": MessageLookupByLibrary.simpleMessage("Світла"),
    "lightTheme": MessageLookupByLibrary.simpleMessage("Світла тема"),
    "markAsLearned": MessageLookupByLibrary.simpleMessage(
      "Позначити як вивчене",
    ),
    "markAsNotLearned": MessageLookupByLibrary.simpleMessage(
      "Позначити як не вивчене",
    ),
    "material3Design": MessageLookupByLibrary.simpleMessage(
      "Material 3 дизайн",
    ),
    "material3DesignDescription": MessageLookupByLibrary.simpleMessage(
      "Сучасний та адаптивний користувацький інтерфейс",
    ),
    "morningMessage": MessageLookupByLibrary.simpleMessage(
      "Доброго ранку! Готовий вивчити щось нове?",
    ),
    "multiLanguageSupport": MessageLookupByLibrary.simpleMessage(
      "Багатомовна підтримка",
    ),
    "multiLanguageSupportDescription": MessageLookupByLibrary.simpleMessage(
      "Доступно англійською та українською мовами",
    ),
    "newWords": MessageLookupByLibrary.simpleMessage("Нові слова"),
    "nextPage": MessageLookupByLibrary.simpleMessage("Наступна сторінка"),
    "nightMessage": MessageLookupByLibrary.simpleMessage(
      "Доброї ночі! Може, трохи легкого читання?",
    ),
    "noDefinitionsAvailable": MessageLookupByLibrary.simpleMessage(
      "Визначення недоступні",
    ),
    "noPdfFiles": MessageLookupByLibrary.simpleMessage("Немає PDF файлів"),
    "noRecentFiles": MessageLookupByLibrary.simpleMessage(
      "Немає останніх файлів",
    ),
    "noRecentFilesDescription": MessageLookupByLibrary.simpleMessage(
      "Відкрийте PDF файл щоб почати",
    ),
    "noTranslationsAvailable": MessageLookupByLibrary.simpleMessage(
      "Переклади недоступні",
    ),
    "noUpdatesAvailable": MessageLookupByLibrary.simpleMessage(
      "Оновлення відсутні",
    ),
    "noWordsFound": MessageLookupByLibrary.simpleMessage("Слова не знайдені"),
    "noWordsFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Спробуйте змінити запит пошуку",
    ),
    "noWordsToStudy": MessageLookupByLibrary.simpleMessage(
      "Немає слів для вивчення",
    ),
    "noun": MessageLookupByLibrary.simpleMessage("Іменник"),
    "ok": MessageLookupByLibrary.simpleMessage("ОК"),
    "openFile": MessageLookupByLibrary.simpleMessage("Відкрити файл"),
    "openPdf": MessageLookupByLibrary.simpleMessage("Відкрити PDF"),
    "openPdfFilePrompt": MessageLookupByLibrary.simpleMessage(
      "Натисніть кнопку нижче, щоб відкрити PDF файл",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("необов\'язково"),
    "other": MessageLookupByLibrary.simpleMessage("Інше"),
    "partOfSpeech": MessageLookupByLibrary.simpleMessage("Частина мови"),
    "partOfSpeechAdjective": MessageLookupByLibrary.simpleMessage("Прикметник"),
    "partOfSpeechAdverb": MessageLookupByLibrary.simpleMessage("Прислівник"),
    "partOfSpeechConjunction": MessageLookupByLibrary.simpleMessage(
      "Сполучник",
    ),
    "partOfSpeechInterjection": MessageLookupByLibrary.simpleMessage("Вигук"),
    "partOfSpeechNoun": MessageLookupByLibrary.simpleMessage("Іменник"),
    "partOfSpeechPreposition": MessageLookupByLibrary.simpleMessage(
      "Прийменник",
    ),
    "partOfSpeechPronoun": MessageLookupByLibrary.simpleMessage("Займенник"),
    "partOfSpeechVerb": MessageLookupByLibrary.simpleMessage("Дієслово"),
    "pdfReading": MessageLookupByLibrary.simpleMessage("Читання PDF"),
    "pdfReadingDescription": MessageLookupByLibrary.simpleMessage(
      "Відкривайте та читайте PDF документи з плавною навігацією",
    ),
    "pdfViewerSettings": MessageLookupByLibrary.simpleMessage(
      "Налаштування PDF переглядача",
    ),
    "personalDictionary": MessageLookupByLibrary.simpleMessage(
      "Особистий словник",
    ),
    "personalDictionaryDescription": MessageLookupByLibrary.simpleMessage(
      "Поповнюйте словниковий запас з власними перекладами слів",
    ),
    "pin": MessageLookupByLibrary.simpleMessage("Закріпити"),
    "pinnedFiles": MessageLookupByLibrary.simpleMessage("Закріплені файли"),
    "pleaseAddAtLeastOneDefinition": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, додайте принаймні одне визначення",
    ),
    "pleaseEnterTranslation": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, введіть переклад",
    ),
    "pleaseEnterWord": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, введіть слово",
    ),
    "pleaseSelectPartOfSpeech": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, оберіть частину мови",
    ),
    "preposition": MessageLookupByLibrary.simpleMessage("Прийменник"),
    "previousPage": MessageLookupByLibrary.simpleMessage("Попередня сторінка"),
    "pronunciation": MessageLookupByLibrary.simpleMessage("Вимова"),
    "pronunciationNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Вимова недоступна",
    ),
    "readyToStudy": MessageLookupByLibrary.simpleMessage(
      "Готовий до вивчення?",
    ),
    "recentFiles": MessageLookupByLibrary.simpleMessage("Останні файли"),
    "recentPdfFiles": MessageLookupByLibrary.simpleMessage(
      "Нещодавні PDF файли",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("Видалити"),
    "rename": MessageLookupByLibrary.simpleMessage("Змінити назву"),
    "save": MessageLookupByLibrary.simpleMessage("Зберегти"),
    "savedWords": MessageLookupByLibrary.simpleMessage("Збережені слова"),
    "searchFiles": MessageLookupByLibrary.simpleMessage("Пошук файлів..."),
    "searchWords": MessageLookupByLibrary.simpleMessage("Пошук слів..."),
    "selectAll": MessageLookupByLibrary.simpleMessage("Вибрати все"),
    "selectWordType": MessageLookupByLibrary.simpleMessage("Оберіть тип слова"),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "stable": MessageLookupByLibrary.simpleMessage("Стабільний"),
    "success": MessageLookupByLibrary.simpleMessage("Успіх"),
    "system": MessageLookupByLibrary.simpleMessage("Системна"),
    "systemTheme": MessageLookupByLibrary.simpleMessage("Системна тема"),
    "textSelected": MessageLookupByLibrary.simpleMessage("Текст виділено"),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Тема"),
    "toggleLearned": MessageLookupByLibrary.simpleMessage(
      "Перемкнути статус вивчення",
    ),
    "totalWords": MessageLookupByLibrary.simpleMessage("Всього слів"),
    "translate": MessageLookupByLibrary.simpleMessage("Перекласти"),
    "translation": MessageLookupByLibrary.simpleMessage("Переклад"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Українська"),
    "unpin": MessageLookupByLibrary.simpleMessage("Відкріпити"),
    "updateAvailable": MessageLookupByLibrary.simpleMessage(
      "Доступне оновлення",
    ),
    "updateAvailableMessage": MessageLookupByLibrary.simpleMessage(
      "Доступна нова версія для завантаження.",
    ),
    "updateChannel": MessageLookupByLibrary.simpleMessage("Канал оновлень"),
    "updateCheckError": MessageLookupByLibrary.simpleMessage(
      "Не вдалося перевірити оновлення. Спробуйте пізніше.",
    ),
    "updatedAt": MessageLookupByLibrary.simpleMessage("Оновлено"),
    "updates": MessageLookupByLibrary.simpleMessage("Оновлення"),
    "verb": MessageLookupByLibrary.simpleMessage("Дієслово"),
    "version": MessageLookupByLibrary.simpleMessage("Версія"),
    "warning": MessageLookupByLibrary.simpleMessage("Попередження"),
    "webVersionLibraryInfo": MessageLookupByLibrary.simpleMessage(
      "У веб-версії файли не зберігаються у списку недавніх",
    ),
    "webVersionMessage": MessageLookupByLibrary.simpleMessage(
      "У веб-версії необхідно перевибрати файл. Використовуйте кнопку \"Відкрити файл\".",
    ),
    "word": MessageLookupByLibrary.simpleMessage("Слово"),
    "wordAdded": MessageLookupByLibrary.simpleMessage(
      "Слово додано до словника",
    ),
    "wordAddedMessage": m5,
    "wordAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Слово вже існує",
    ),
    "wordAlreadyExistsMessage": m6,
    "wordCopied": MessageLookupByLibrary.simpleMessage(
      "Слово скопійовано в буфер обміну",
    ),
    "wordDefinitions": MessageLookupByLibrary.simpleMessage("Визначення"),
    "wordDetails": MessageLookupByLibrary.simpleMessage("Деталі слова"),
    "wordInformation": MessageLookupByLibrary.simpleMessage(
      "Інформація про слово",
    ),
    "wordLearned": MessageLookupByLibrary.simpleMessage("Слово вивчене"),
    "wordTranslations": MessageLookupByLibrary.simpleMessage("Переклади"),
    "wordType": MessageLookupByLibrary.simpleMessage("Тип слова"),
    "wordUnlearned": MessageLookupByLibrary.simpleMessage(
      "Слово позначене як нове",
    ),
    "wordsToStudy": MessageLookupByLibrary.simpleMessage("Слова для вивчення"),
    "youAreUsingLatestVersion": MessageLookupByLibrary.simpleMessage(
      "Ви використовуєте останню версію",
    ),
    "zoomIn": MessageLookupByLibrary.simpleMessage("Збільшити"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("Зменшити"),
  };
}
