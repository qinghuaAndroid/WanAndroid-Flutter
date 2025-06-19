import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/res/src/strings.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';

///显示公共弹窗
showCommonDialog({
  String title = '',
  String content = '',
  String backText = '',
  String nextText = '',
  bool backVisible = true,
  bool nextVisible = true,
  VoidCallback? backTap,
  VoidCallback? nextTap,
}) {
  SmartDialog.show(
    builder: (BuildContext context) {
      return CommonDialog(
        title: title,
        content: content,
        backText: backText.isEmpty ? StringStyles.quit.tr : backText,
        nextText: nextText.isEmpty ? StringStyles.enter.tr : nextText,
        backVisible: backVisible,
        nextVisible: nextVisible,
        backTap: backTap,
        nextTap: nextTap,
      );
    },
  );
}
