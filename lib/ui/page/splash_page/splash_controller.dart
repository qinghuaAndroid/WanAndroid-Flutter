import 'package:wan_android_flutter/base/get/get_controller_inject.dart';

class SplashController extends BaseGetController{
  ///用来控制动画的状态
  double opacityLevel = 0.0;

  @override
  void onInit() {
    super.onInit();
    lazyInitAnim();
  }

  void lazyInitAnim() {
    Future.delayed(const Duration(milliseconds: 200)).then((value){
      opacityLevel = 1.0;
      update();
    });
  }
}