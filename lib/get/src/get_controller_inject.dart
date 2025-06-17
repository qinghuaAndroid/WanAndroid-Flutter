import 'package:get/get.dart';
import 'package:wan_android_flutter/http/src/request_repository.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends GetxController {
  ///HTTP请求仓库
  late RequestRepository request;

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}
