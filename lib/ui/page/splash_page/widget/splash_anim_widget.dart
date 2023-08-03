import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/base/get/get_common_view.dart';
import 'package:wan_android_flutter/res/r.dart';
import 'package:wan_android_flutter/res/strings.dart';
import 'package:wan_android_flutter/res/style.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/splash_page/splash_controller.dart';
import 'package:wan_android_flutter/util/save/sp_util.dart';

class SplashAnimWidget extends GetCommonView<SplashController> {
  const SplashAnimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      onEnd: () {
        Get.offNamed(
          SpUtil.getUserInfo() == null ? Routes.loginPage : Routes.homePage,
        );
      },
      opacity: controller.opacityLevel,
      duration: const Duration(seconds: 200),
      child: Container(
        margin: const EdgeInsets.only(top: 120),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              R.assetsImagesApplication,
              fit: BoxFit.fitWidth,
              width: 110,
              height: 110,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                StringStyles.appName.tr,
                style: Styles.style_black_36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
