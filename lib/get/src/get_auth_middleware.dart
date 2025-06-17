import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class AuthMiddleware extends GetMiddleware {
  ///重定向
  /// 当搜索被调用路由的页面时，此函数将被调用。它接收 RouteSettings 作为重定向到的结果。如果将其设置为 null，则不会进行重定向。
  @override
  RouteSettings? redirect(String? route) {
    return SpUtil.getUserInfo() == null
        ? RouteSettings(name: Routes.loginPage)
        : null;
  }
}
