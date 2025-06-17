import 'package:get/get.dart';

import 'login_controller.dart';

/// @class : SplashBinding
/// @date : 2021/08/16
/// @name : jhf
/// @description :启动页 binding层
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
