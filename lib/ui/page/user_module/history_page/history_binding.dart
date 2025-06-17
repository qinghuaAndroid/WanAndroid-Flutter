import 'package:get/get.dart';

import 'history_controller.dart';

/// @class : HistoryBinding
/// @date : 2021/9/9
/// @name : jhf
/// @description :历史记录 binding层
class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
