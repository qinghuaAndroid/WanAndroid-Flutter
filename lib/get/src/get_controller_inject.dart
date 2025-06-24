import 'package:get/get.dart';
import 'package:wan_android_flutter/http/src/request_repository.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends GetxController {
  ///HTTP请求仓库
  late RequestRepository request;

  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  var loadState = 0.obs;

  ///加载成功，是否显示空页面
  showSuccess(dynamic data) {
    loadState.value = data is! List || data.isNotEmpty ? 1 : 2;
  }

  ///加载失败,显示失败页面
  showError() {
    loadState.value = 3;
  }

  ///重新加载
  showLoading() {
    loadState.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}
