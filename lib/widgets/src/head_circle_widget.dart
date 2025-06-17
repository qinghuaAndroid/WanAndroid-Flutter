import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : HeadCircleWidget
/// @date : 2021/08/23
/// @name : jhf
/// @description :圆角头像处理框
class HeadCircleWidget extends StatelessWidget {
  final double width;
  final double height;

  final IconData? icon;

  const HeadCircleWidget({
    super.key,
    this.width = 60,
    this.height = 60,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: SvgPicture.asset(R.assetsImagesDefaultHeader),
      ),
    );
  }
}
