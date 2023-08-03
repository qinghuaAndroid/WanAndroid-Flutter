import 'package:get/get.dart';
import 'package:wan_android_flutter/res/strings.dart';
import 'package:wan_android_flutter/ui/dialog/dialog_loading.dart';

extension GetExtension on GetInterface {
  ///隐藏dialog
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  ///显示dialog
  showLoading({String text = ''}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        LoadingDialog(text: text.isEmpty ? StringStyles.loading.tr : text),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }
}
