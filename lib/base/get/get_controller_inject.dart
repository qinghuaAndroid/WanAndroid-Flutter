import 'package:get/get.dart';
import 'package:wan_android_flutter/http/request_repository.dart';

class BaseGetController extends GetxController {
  ///HTTP请求仓库
  late RequestRepository request;

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}
