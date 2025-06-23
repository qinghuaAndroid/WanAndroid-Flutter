import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/splash_page/splash_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : SplashAnimWidget
/// @date : 2021/08/17
/// @name : jhf
/// @description :动画Widget
class SplashAnimWidget extends GetCommonView<SplashController> {
  const SplashAnimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      onEnd: () {
        Navigate.popAndPush(Routes.mainPage);
      },
      opacity: controller.opacityLevel,
      duration: const Duration(milliseconds: 2000),
      child: Container(
        margin: EdgeInsets.only(top: 170.h),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(assetImage('logo_green'), width: 100.w, height: 100.w),
            Padding(
              padding: EdgeInsets.only(top: 6.w),
              child: Text(
                StringStyles.appName.tr,
                style: TextStyle(
                  color: ColorStyle.color_00CAAE,
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.w),
              child: Text(
                "一个专业的Android社区",
                style: TextStyle(
                  color: ColorStyle.color_999999,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
