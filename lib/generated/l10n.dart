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
  String get app_title {
    return Intl.message('Honyomi', name: 'app_title', desc: '', args: []);
  }

  /// `Reader`
  String get nav_reader {
    return Intl.message('Reader', name: 'nav_reader', desc: '', args: []);
  }

  /// `Dictionary`
  String get nav_dictionary {
    return Intl.message(
      'Dictionary',
      name: 'nav_dictionary',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get nav_settings {
    return Intl.message('Settings', name: 'nav_settings', desc: '', args: []);
  }

  /// `Open PDF`
  String get open_pdf {
    return Intl.message('Open PDF', name: 'open_pdf', desc: '', args: []);
  }

  /// `Select all`
  String get select_all {
    return Intl.message('Select all', name: 'select_all', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Translate`
  String get translate {
    return Intl.message('Translate', name: 'translate', desc: '', args: []);
  }

  /// `Add to dictionary`
  String get add_to_dictionary {
    return Intl.message(
      'Add to dictionary',
      name: 'add_to_dictionary',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `No document opened`
  String get no_document {
    return Intl.message(
      'No document opened',
      name: 'no_document',
      desc: '',
      args: [],
    );
  }

  /// `Translating...`
  String get translation_loading {
    return Intl.message(
      'Translating...',
      name: 'translation_loading',
      desc: '',
      args: [],
    );
  }

  /// `Translation failed`
  String get translation_error {
    return Intl.message(
      'Translation failed',
      name: 'translation_error',
      desc: '',
      args: [],
    );
  }

  /// `Google Translate`
  String get translator_provider {
    return Intl.message(
      'Google Translate',
      name: 'translator_provider',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Version`
  String get app_version {
    return Intl.message('Version', name: 'app_version', desc: '', args: []);
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `System`
  String get theme_system {
    return Intl.message('System', name: 'theme_system', desc: '', args: []);
  }

  /// `Light`
  String get theme_light {
    return Intl.message('Light', name: 'theme_light', desc: '', args: []);
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message('Dark', name: 'theme_dark', desc: '', args: []);
  }

  /// `Accent color`
  String get accent_color {
    return Intl.message(
      'Accent color',
      name: 'accent_color',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get accent_system {
    return Intl.message('System', name: 'accent_system', desc: '', args: []);
  }

  /// `Red`
  String get accent_red {
    return Intl.message('Red', name: 'accent_red', desc: '', args: []);
  }

  /// `Blue`
  String get accent_blue {
    return Intl.message('Blue', name: 'accent_blue', desc: '', args: []);
  }

  /// `Green`
  String get accent_green {
    return Intl.message('Green', name: 'accent_green', desc: '', args: []);
  }

  /// `Purple`
  String get accent_purple {
    return Intl.message('Purple', name: 'accent_purple', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `App language`
  String get app_language {
    return Intl.message(
      'App language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get language_system {
    return Intl.message('System', name: 'language_system', desc: '', args: []);
  }

  /// `English`
  String get language_en {
    return Intl.message('English', name: 'language_en', desc: '', args: []);
  }

  /// `Ukrainian`
  String get language_uk {
    return Intl.message('Ukrainian', name: 'language_uk', desc: '', args: []);
  }

  /// `Check for updates`
  String get check_updates {
    return Intl.message(
      'Check for updates',
      name: 'check_updates',
      desc: '',
      args: [],
    );
  }

  /// `Update available`
  String get update_available {
    return Intl.message(
      'Update available',
      name: 'update_available',
      desc: '',
      args: [],
    );
  }

  /// `You have the latest version`
  String get you_have_latest {
    return Intl.message(
      'You have the latest version',
      name: 'you_have_latest',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
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
