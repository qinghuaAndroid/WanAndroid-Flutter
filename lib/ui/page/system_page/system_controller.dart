import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';

class SystemController extends BaseGetController {
  ///知识体系
  List<SystemEntity> systems = [];

  @override
  void onInit() {
    super.onInit();
    requestData();
  }

  void requestData() {
    request.requestSystems(
      success: (data) {
        systems.addAll(data);
        showSuccess(data);
        update();
      },
      fail: (code, msg) {
        showError();
      },
    );
  }
}
