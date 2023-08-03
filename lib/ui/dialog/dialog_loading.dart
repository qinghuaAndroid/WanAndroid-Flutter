import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wan_android_flutter/res/r.dart';
import 'package:wan_android_flutter/res/strings.dart';
import 'package:wan_android_flutter/res/style.dart';

/// @class : LoadingDialog
/// @date : 2021/08/18
/// @name : jhf
/// @description :公共加载弹窗
class LoadingDialog extends StatelessWidget {
  final String text;

  const LoadingDialog({
    Key? key,
    this.text = StringStyles.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    R.assetsLottieLoading,
                    width: 60,
                    animate: true,
                  ),
                ),
                Text(text, style: Styles.style_white_14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
