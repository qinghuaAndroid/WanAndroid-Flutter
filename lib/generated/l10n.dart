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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A professional Android community`
  String get slogan {
    return Intl.message(
      'A professional Android community',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Play Android`
  String get tab_1 {
    return Intl.message(
      'Play Android',
      name: 'tab_1',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge System`
  String get tab_2 {
    return Intl.message(
      'Knowledge System',
      name: 'tab_2',
      desc: '',
      args: [],
    );
  }

  /// `Public Account`
  String get tab_3 {
    return Intl.message(
      'Public Account',
      name: 'tab_3',
      desc: '',
      args: [],
    );
  }

  /// `navigation`
  String get tab_4 {
    return Intl.message(
      'navigation',
      name: 'tab_4',
      desc: '',
      args: [],
    );
  }

  /// `project`
  String get tab_5 {
    return Intl.message(
      'project',
      name: 'tab_5',
      desc: '',
      args: [],
    );
  }

  /// `My Collection`
  String get nav_my_collect {
    return Intl.message(
      'My Collection',
      name: 'nav_my_collect',
      desc: '',
      args: [],
    );
  }

  /// `System Settings`
  String get nav_setting {
    return Intl.message(
      'System Settings',
      name: 'nav_setting',
      desc: '',
      args: [],
    );
  }

  /// `about Us`
  String get nav_about_us {
    return Intl.message(
      'about Us',
      name: 'nav_about_us',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get nav_logout {
    return Intl.message(
      'Log out',
      name: 'nav_logout',
      desc: '',
      args: [],
    );
  }

  /// `Night Mode`
  String get nav_night_mode {
    return Intl.message(
      'Night Mode',
      name: 'nav_night_mode',
      desc: '',
      args: [],
    );
  }

  /// `TODO`
  String get nav_todo {
    return Intl.message(
      'TODO',
      name: 'nav_todo',
      desc: '',
      args: [],
    );
  }

  /// `square`
  String get nav_square {
    return Intl.message(
      'square',
      name: 'nav_square',
      desc: '',
      args: [],
    );
  }

  /// `My Points`
  String get nav_my_score {
    return Intl.message(
      'My Points',
      name: 'nav_my_score',
      desc: '',
      args: [],
    );
  }

  /// `Relax`
  String get nav_girl {
    return Intl.message(
      'Relax',
      name: 'nav_girl',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get nav_question {
    return Intl.message(
      'Questions',
      name: 'nav_question',
      desc: '',
      args: [],
    );
  }

  /// `ID:`
  String get nav_id {
    return Intl.message(
      'ID:',
      name: 'nav_id',
      desc: '',
      args: [],
    );
  }

  /// `grade:`
  String get nav_grade {
    return Intl.message(
      'grade:',
      name: 'nav_grade',
      desc: '',
      args: [],
    );
  }

  /// `Ranking:`
  String get nav_rank {
    return Intl.message(
      'Ranking:',
      name: 'nav_rank',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
