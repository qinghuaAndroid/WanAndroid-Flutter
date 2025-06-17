import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : LogoNameWidget
/// @date : 2021/08/16
/// @name : jhf
/// @description :登录Logo
class LogoNameWidget extends StatelessWidget {
  const LogoNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            R.assetsImagesApplicationTransparent,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 80,
          ),
          Text(StringStyles.appName.tr, style: Styles.style_white_36),
        ],
      ),
    );
  }
}
