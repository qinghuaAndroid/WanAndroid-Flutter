import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenUtil {
  /// 移除状态栏半透明
  static removeSystemTransparent(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }
}
