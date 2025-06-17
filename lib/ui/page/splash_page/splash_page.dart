import 'package:flutter/material.dart';
import 'package:wan_android_flutter/res/src/r.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'widget/splash_anim_widget.dart';

/// @class : SplashPage
/// @date : 2021/08/15
/// @name : jhf
/// @description :启动页 View层
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeSystemTransparent(context);

    ///预缓存背景图片
    precacheImage(const AssetImage(R.assetsImagesLoginBackground), context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashAnimWidget(),
    );
  }
}
