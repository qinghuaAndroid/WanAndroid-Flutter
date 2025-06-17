import 'package:get/get.dart';
import 'package:wan_android_flutter/ui/page/complex_module/ask_page/ask_controller.dart';
import 'package:wan_android_flutter/ui/page/complex_module/complex_page/complex_controller.dart';
import 'package:wan_android_flutter/ui/page/complex_module/main_page/main_controller.dart';
import 'package:wan_android_flutter/ui/page/complex_module/square_page/square_controller.dart';
import 'package:wan_android_flutter/ui/page/my_page/my_controller.dart';
import 'package:wan_android_flutter/ui/page/project_page/project_controller.dart';

/// @class : HomeBinding
/// @date : 2021/08/20
/// @name : jhf
/// @description :首页 binding层
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => ComplexController());
    Get.lazyPut(() => AskController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => MyController());
    Get.lazyPut(() => SquareController());
  }
}
