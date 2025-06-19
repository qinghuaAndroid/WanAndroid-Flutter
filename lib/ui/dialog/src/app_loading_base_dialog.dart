import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/res/res.dart';

class BaseLoadingDialog {
  ///显示
  static void show({bool canDismiss = true}) {
    SmartDialog.dismiss(tag: "loading");
    showLoadingDialog(canDismiss: canDismiss);
  }

  static void showLoading({bool canDismiss = true, VoidCallback? onMask}) {
    SmartDialog.dismiss(tag: "loading");
    showLoadingDialog(canDismiss: canDismiss, onMask: onMask);
  }

  static void hide() {
    SmartDialog.dismiss(tag: "loading");
  }
}

void showLoadingDialog({bool canDismiss = true, VoidCallback? onMask}) {
  SmartDialog.show(
    tag: "loading",
    clickMaskDismiss: canDismiss,
    onDismiss: () {},
    onMask: onMask,
    builder: (BuildContext context) {
      return bufferingView(context);
    },
  );
}

Widget bufferingView(BuildContext context) {
  return IgnorePointer(
    child: Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      color: Colors.black.withOpacity(0.05),
      child: Center(
        child: Container(
          width: 136.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(22.w)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: CircularProgressIndicator(strokeWidth: 2.w),
                ),
                SizedBox(width: 6.w),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 32.w,
                  child: Text(
                    StringStyles.loading.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
