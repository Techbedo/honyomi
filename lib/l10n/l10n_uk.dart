// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Хоньомі';

  @override
  String get library => 'Бібліотека';

  @override
  String get dictionary => 'Словник';

  @override
  String get settings => 'Налаштування';

  @override
  String get about => 'Про застосунок';

  @override
  String get openPdf => 'Відкрити PDF';

  @override
  String get openFile => 'Відкрити файл';

  @override
  String get lastOpenedFiles => 'Нещодавно відкриті файли';

  @override
  String get recentFiles => 'Останні файли';

  @override
  String get noRecentFiles => 'Немає останніх файлів';

  @override
  String get noRecentFilesDescription => 'Відкрийте PDF файл щоб почати';

  @override
  String get libraryDescription =>
      'Керуйте вашими PDF файлами та останніми документами';

  @override
  String get fileNotFound => 'Файл не знайдено';

  @override
  String get remove => 'Видалити';

  @override
  String get previousPage => 'Попередня сторінка';

  @override
  String get nextPage => 'Наступна сторінка';

  @override
  String get zoomIn => 'Збільшити';

  @override
  String get zoomOut => 'Зменшити';

  @override
  String get addBookmark => 'Додати закладку';

  @override
  String get closePdf => 'Закрити PDF';

  @override
  String get addWord => 'Додати слово';

  @override
  String get copy => 'Копіювати';

  @override
  String get selectAll => 'Вибрати все';

  @override
  String get addToDictionary => 'Додати до словника';

  @override
  String get translate => 'Перекласти';

  @override
  String get delete => 'Видалити';

  @override
  String get theme => 'Тема';

  @override
  String get language => 'Мова';

  @override
  String get darkMode => 'Темна тема';

  @override
  String get version => 'Версія';

  @override
  String get license => 'Ліцензія';

  @override
  String get description => 'Опис';

  @override
  String get appDescription =>
      'Хоньомі  це розумний читач для вивчення мов, який допомагає читати PDF документи та поповнювати словниковий запас. Ідеально підходить для тих, хто вивчає мови та хоче покращити навички читання під час навчання.';

  @override
  String get word => 'Слово';

  @override
  String get translation => 'Переклад';

  @override
  String get enterWord => 'Введіть слово';

  @override
  String get enterTranslation => 'Введіть переклад';

  @override
  String get cancel => 'Скасувати';

  @override
  String get add => 'Додати';

  @override
  String get wordAdded => 'Слово додано до словника';

  @override
  String get emptyDictionary => 'Ваш словник порожній';

  @override
  String get addFirstWord =>
      'Додайте ваше перше слово щоб почати поповнювати словниковий запас';

  @override
  String get system => 'Системна';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';

  @override
  String get english => 'English';

  @override
  String get ukrainian => 'Українська';

  @override
  String get pdfViewerSettings => 'Налаштування PDF переглядача';

  @override
  String get configurePdfPreferences => 'Налаштуйте параметри перегляду PDF';

  @override
  String get enableZoom => 'Увімкнути масштабування';

  @override
  String get allowZoomingInPdfViewer =>
      'Дозволити масштабування в PDF переглядачі';

  @override
  String get autoSaveBookmarks => 'Автозбереження закладок';

  @override
  String get automaticallySaveReadingPosition =>
      'Автоматично зберігати позицію читання';

  @override
  String get builtWith => 'Розроблено з';

  @override
  String get features => 'Функції';

  @override
  String get pdfReading => 'Читання PDF';

  @override
  String get pdfReadingDescription =>
      'Відкривайте та читайте PDF документи з плавною навігацією';

  @override
  String get personalDictionary => 'Особистий словник';

  @override
  String get personalDictionaryDescription =>
      'Поповнюйте словниковий запас з власними перекладами слів';

  @override
  String get multiLanguageSupport => 'Багатомовна підтримка';

  @override
  String get multiLanguageSupportDescription =>
      'Доступно англійською та українською мовами';

  @override
  String get material3Design => 'Material 3 дизайн';

  @override
  String get material3DesignDescription =>
      'Сучасний та адаптивний користувацький інтерфейс';

  @override
  String wordAddedMessage(String word, String translation) {
    return 'Слово \'$word\' - \'$translation\' додано до словника';
  }

  @override
  String get savedWords => 'Збережені слова';
}
