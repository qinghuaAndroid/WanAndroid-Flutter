// 使用Provider
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class LocaleProvider extends ChangeNotifierProvider<LocaleNotifier> {
  LocaleProvider({super.key}) : super.value(value: LocaleNotifier());
}

class LocaleNotifier extends ChangeNotifier {
  Locale _locale = Locale.fromSubtags(languageCode: 'zh');

  LocaleNotifier() {
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      _locale = Locale.fromSubtags(languageCode: 'zh');
    } else {
      _locale = Locale(language.language, language.country);
    }
  }

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
