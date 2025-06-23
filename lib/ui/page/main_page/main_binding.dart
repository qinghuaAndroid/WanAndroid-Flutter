import 'package:get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/ui/page/home_page/home_controller.dart';
import 'package:wan_android_flutter/ui/page/navigation_page/navigation_controller.dart';
import 'package:wan_android_flutter/ui/page/system_page/system_controller.dart';
import 'package:wan_android_flutter/ui/page/tabs_page/tabs_controller.dart';

import 'main_controller.dart';

/// @class : MainBinding
/// @date : 2021/08/20
/// @name : jhf
/// @description :首页 binding层
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SystemController());
    Get.lazyPut(() => TabsController(), tag: TagType.publicNumber.toString());
    Get.lazyPut(() => TabsController(), tag: TagType.project.toString());
    Get.lazyPut(() => NavigationController());
  }
}
