import 'package:get/get.dart';

import 'share_controller.dart';

/// @class : ShareBinding
/// @date : 2021/09/14
/// @name : jhf
/// @description :分享页面 binding层
class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
