import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : AboutController
/// @date : 2021/08/25
/// @name : jhf
/// @description :关于我们 控制器层
class AboutController extends BaseGetController {
  ///用户信息
  late UserEntity userInfo;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    if (info != null) {
      userInfo = info;
      update();
    }
  }
}
