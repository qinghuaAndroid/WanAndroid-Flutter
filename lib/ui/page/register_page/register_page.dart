import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'register_controller.dart';

/// @class : RegisterPage
/// @date : 2021/08/17
/// @name : jhf
/// @description :注册 View层
class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(StringStyles.registerButton.tr),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
      ),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            DividerStyle.divider1Half,
            SizedBox(height: 100),

            ///账户名输入框
            EditWidget(
              hintText: StringStyles.loginAccountNameHint.tr,
              onChanged: (text) => controller
                ..account = text
                ..update(),
            ),

            ///密码输入框
            EditWidget(
              hintText: StringStyles.loginAccountPwdHint.tr,
              passwordType: true,
              onChanged: (text) => controller
                ..password = text
                ..update(),
            ),

            ///再次输入密码输入框
            EditWidget(
              hintText: StringStyles.loginAccountRePwdHint.tr,
              passwordType: true,
              onChanged: (text) => controller
                ..rePassword = text
                ..update(),
            ),

            ///注册按钮
            Container(
              width: double.infinity,
              height: 45.w,
              margin: EdgeInsets.only(top: 50.w, left: 50.w, right: 50.w),
              decoration: BoxDecoration(
                color: controller.changeShowButton()
                    ? Provider.of<ThemeColorsNotifier>(context).color
                    : Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
              ),
              child: TextButton(
                style: controller.changeShowButton()
                    ? ButtonStyles.getButtonStyle()
                    : ButtonStyles.getTransparentStyle(),
                onPressed: () {
                  KeyboardUtils.hideKeyboard(context);
                  controller.register();
                },
                child: Text(
                  StringStyles.registerButton.tr,
                  style: controller.changeShowButton()
                      ? Styles.style_white_16
                      : Styles.style_white_16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
