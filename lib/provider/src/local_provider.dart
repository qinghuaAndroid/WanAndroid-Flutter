// 使用Provider
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LocaleProvider extends ChangeNotifierProvider<LocaleNotifier> {
  LocaleProvider({super.key}) : super.value(value: LocaleNotifier());
}

class LocaleNotifier extends ChangeNotifier {
  Locale _locale = const Locale.fromSubtags(languageCode: 'zh');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
