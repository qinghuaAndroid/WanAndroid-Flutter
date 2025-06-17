import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : SettingController
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置 控制器层
class SettingController extends BaseGetController {
  ///缓存大小
  var cache = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  ///加载缓存
  loadCache() {
    CacheUtil.loadCache().then((value) {
      cache.value = CacheUtil.byte2FitMemorySize(value);
    });
  }

  ///清除缓存
  clearCacheFile() {
    CacheUtil.clearCache().then((value) {
      loadCache();
      ToastUtils.show(
        value
            ? StringStyles.settingCacheSuccess.tr
            : StringStyles.settingCacheFail.tr,
      );
    });
  }

  ///退出登录
  exitLoginState() {
    SpUtil.deleteUserInfo();
    request.exitLogin();
    Navigate.cleanRouteAndPush(Routes.loginPage);
  }
}
