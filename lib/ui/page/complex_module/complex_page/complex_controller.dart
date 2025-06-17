import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/http/http.dart';

/// @class : ComplexController
/// @date : 2021/08/23
/// @name : jhf
/// @description :综合页 控制器层
class ComplexController extends BaseGetController {
  @override
  void onInit() {
    super.onInit();
    requestTabModule();
  }

  void requestTabModule() {
    Request.get<dynamic>(
      RequestApi.apiTab,
      {},
      dialog: false,
      success: (data) {
        debugPrint("信息>>>$data");
      },
      fail: (code, msg) {},
    );
  }
}
