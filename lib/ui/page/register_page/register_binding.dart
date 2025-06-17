import 'package:get/get.dart';

import 'register_controller.dart';

/// @class : RegisterBinding
/// @date : 2021/08/16
/// @name : jhf
/// @description :启动页 binding层
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
