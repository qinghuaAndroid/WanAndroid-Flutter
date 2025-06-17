import 'package:flutter/material.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : Ripple
/// @date : 2021/9/3
/// @name : jhf
/// @description :点击波纹效果Widget
class Ripple extends StatelessWidget {
  ///点击事件
  final GestureTapCallback? onTap;

  ///圆角大小
  final double circular;

  ///widget
  final Widget child;

  const Ripple({super.key, this.onTap, this.circular = 0, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(circular)),
      onTap: onTap,
      splashColor: ColorStyle.color_E2E3E8_66,
      highlightColor: ColorStyle.color_E2E3E8_66,
      child: child,
    );
  }
}
