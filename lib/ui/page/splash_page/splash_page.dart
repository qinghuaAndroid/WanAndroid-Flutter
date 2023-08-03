import 'package:flutter/material.dart';
import 'package:wan_android_flutter/res/r.dart';
import 'package:wan_android_flutter/ui/page/splash_page/widget/splash_anim_widget.dart';
import 'package:wan_android_flutter/util/screen_util.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeSystemTransparent(context);

    ///预缓存背景图片
    precacheImage(const AssetImage(R.assetsImagesLoginBackground), context);
    return const Scaffold(
        backgroundColor: Colors.white, body: SplashAnimWidget());
  }
}
