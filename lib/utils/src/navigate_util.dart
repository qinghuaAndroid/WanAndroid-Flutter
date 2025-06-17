import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// @class : Navigate
/// @date : 2021/08/25
/// @name : jhf
/// @description : 导航
class Navigate {
  /// 获取全局context
  static get currentContext => Get.context;

  static Future<T?>? push<T extends Object?>(String name, {dynamic arguments}) {
    return Get.toNamed(name, arguments: arguments);
  }

  /// 关闭当前页并跳转新页面
  static Future<T?>? popAndPush<T extends Object?>(
    String name, {
    Map<String, dynamic>? arguments,
  }) {
    return Get.offNamed(name, preventDuplicates: false, arguments: arguments);
  }

  /// 关闭目标路由页及其栈顶的所有页面
  static void popUntil(String name) {
    Get.until((route) => Get.currentRoute == name);
  }

  /// 清除路由栈并去新页面
  static void cleanRouteAndPush(String name) {
    Get.offAllNamed(name);
  }

  /// 返回
  static void pop<T>({T? result, bool closeOverlays = false}) {
    Get.back(result: result, closeOverlays: closeOverlays);
  }

  ///获取当前page
  static String getCurrentRoute() {
    return Get.currentRoute;
  }

  ///打开浏览器
  ///[url] 链接
  static Future<Null> launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
