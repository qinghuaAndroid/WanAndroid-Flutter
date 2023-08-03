import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/app/app_theme.dart';
import 'package:wan_android_flutter/res/strings.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/splash_page/splash_binding.dart';
import 'package:wan_android_flutter/ui/page/splash_page/splash_page.dart';
import 'package:wan_android_flutter/util/injection_init.dart';
import 'package:wan_android_flutter/util/keyboard_util.dart';
import 'package:wan_android_flutter/util/local_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(GetMaterialApp(
    getPages: Routes.routePage,
    debugShowCheckedModeBanner: true,
    initialRoute: "/",
    builder: (context, child) {
      // Global GestureDetector that will dismiss the keyboard
      return GestureDetector(
        onTap: () {
          KeyboardUtils.hideKeyboard(context);
        },
        child: child,
      );
    },

    ///主题颜色
    theme: appThemeData,

    ///国际化支持-来源配置
    translations: Messages(),

    ///国际化支持-默认语言
    locale: LocalOptions.getDefault(),

    ///国际化支持-备用语言
    fallbackLocale: const Locale('en', 'US'),
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    home: const SplashPage(),
  ));
}
