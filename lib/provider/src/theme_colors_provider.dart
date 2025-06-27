// 使用Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class ThemeColorsProvider extends ChangeNotifierProvider<ThemeColorsNotifier> {
  ThemeColorsProvider({super.key}) : super.value(value: ThemeColorsNotifier());
}

class ThemeColorsNotifier extends ChangeNotifier {
  Color _color = Colors.lightBlueAccent;

  ThemeColorsNotifier() {
    _color = SpUtil.getThemeColor() ?? Colors.lightBlueAccent;
  }

  Color get color => _color;

  void setColor(Color color) {
    _color = color;
    notifyListeners();
    SpUtil.updateThemeColor(color);
  }
}
