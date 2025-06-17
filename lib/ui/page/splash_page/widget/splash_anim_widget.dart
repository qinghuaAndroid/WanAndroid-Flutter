import 'package:flutter/cupertino.dart';
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
        Navigate.popAndPush(Routes.homePage);
      },
      opacity: controller.opacityLevel,
      duration: const Duration(milliseconds: 2000),
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
