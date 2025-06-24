
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';

class NavigationController extends BaseGetController {
  ///知识体系
  List<Navigation> navigationList = [];

  @override
  void onInit() {
    super.onInit();
    requestData();
  }

  void requestData() {
    request.navigationData(
      success: (data) {
        navigationList.addAll(data);
        showSuccess(data);
        update();
      },
      fail: (code, msg) {},
    );
  }
}