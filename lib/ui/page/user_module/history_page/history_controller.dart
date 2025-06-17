import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : HistoryController
/// @date : 2021/9/9
/// @name : jhf
/// @description :历史记录 控制器层
class HistoryController extends BaseGetController {
  ///历史记录
  List<ProjectDetail> historyList = [];

  @override
  void onInit() {
    super.onInit();
    historyList = SpUtil.getBrowseHistoryModel();
    update();
  }
}
