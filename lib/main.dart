import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';

import 'app/app_theme.dart';
import 'generated/l10n.dart';
import 'routes/navigation_history_observer.dart';
import 'routes/router_reporter.dart';
import 'routes/routes.dart';
import 'ui/page/splash_page/splash_binding.dart';
import 'ui/page/splash_page/splash_page.dart';
import 'utils/src/injection_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injection.init();
  runApp(
    MultiProvider(
      providers: [LocaleProvider(), ThemeColorsProvider()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
        child: GetMaterialApp(
          navigatorObservers: [NavigationHistoryObserver(), routeObserver],
          getPages: Routes.routePage,
          debugShowCheckedModeBanner: false,
          popGesture: Get.isPopGestureEnable,
          initialRoute: '/',
          unknownRoute: Routes.unknownPage,
          theme: appThemeData,
          //主题颜色
          translations: Messages(),
          //国际化支持-来源配置
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // 当前语言
          locale: Provider.of<LocaleNotifier>(context).locale,
          //国际化支持-默认语言
          fallbackLocale: const Locale('zh', 'CN'),
          //国际化支持-备用语言
          defaultTransition: Transition.native,
          initialBinding: SplashBinding(),
          home: const SplashPage(),
          builder: FlutterSmartDialog.init(),
        ),
      ),
    );
  }
}
