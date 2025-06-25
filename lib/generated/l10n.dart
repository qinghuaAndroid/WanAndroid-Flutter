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

  /// `玩Android`
  String get tab_1 {
    return Intl.message(
      '玩Android',
      name: 'tab_1',
      desc: '',
      args: [],
    );
  }

  /// `知识体系`
  String get tab_2 {
    return Intl.message(
      '知识体系',
      name: 'tab_2',
      desc: '',
      args: [],
    );
  }

  /// `公众号`
  String get tab_3 {
    return Intl.message(
      '公众号',
      name: 'tab_3',
      desc: '',
      args: [],
    );
  }

  /// `导航`
  String get tab_4 {
    return Intl.message(
      '导航',
      name: 'tab_4',
      desc: '',
      args: [],
    );
  }

  /// `项目`
  String get tab_5 {
    return Intl.message(
      '项目',
      name: 'tab_5',
      desc: '',
      args: [],
    );
  }

  /// `我的收藏`
  String get nav_my_collect {
    return Intl.message(
      '我的收藏',
      name: 'nav_my_collect',
      desc: '',
      args: [],
    );
  }

  /// `系统设置`
  String get nav_setting {
    return Intl.message(
      '系统设置',
      name: 'nav_setting',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get nav_about_us {
    return Intl.message(
      '关于我们',
      name: 'nav_about_us',
      desc: '',
      args: [],
    );
  }

  /// `退出登录`
  String get nav_logout {
    return Intl.message(
      '退出登录',
      name: 'nav_logout',
      desc: '',
      args: [],
    );
  }

  /// `夜间模式`
  String get nav_night_mode {
    return Intl.message(
      '夜间模式',
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

  /// `广场`
  String get nav_square {
    return Intl.message(
      '广场',
      name: 'nav_square',
      desc: '',
      args: [],
    );
  }

  /// `我的积分`
  String get nav_my_score {
    return Intl.message(
      '我的积分',
      name: 'nav_my_score',
      desc: '',
      args: [],
    );
  }

  /// `轻松一下`
  String get nav_girl {
    return Intl.message(
      '轻松一下',
      name: 'nav_girl',
      desc: '',
      args: [],
    );
  }

  /// `问答`
  String get nav_question {
    return Intl.message(
      '问答',
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

  /// `等级:`
  String get nav_grade {
    return Intl.message(
      '等级:',
      name: 'nav_grade',
      desc: '',
      args: [],
    );
  }

  /// `排名:`
  String get nav_rank {
    return Intl.message(
      '排名:',
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
