import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'login_controller.dart';

/// @class : LoginPage
/// @date : 2021/08/17
/// @name : jhf
/// @description :登录 View层
class LoginPage extends GetCommonView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 200),

            ///账户名输入框
            EditWidget(
              iconWidget: const Icon(Icons.perm_identity, color: Colors.black54),
              hintText: StringStyles.loginAccountNameHint.tr,
              onChanged: (text) => controller
                ..account = text
                ..update(),
            ),

            ///密码输入框
            EditWidget(
              iconWidget: const Icon(Icons.lock_open, color: Colors.black54),
              hintText: StringStyles.loginAccountPwdHint.tr,
              passwordType: true,
              onChanged: (text) => controller
                ..password = text
                ..update(),
            ),

            ///登录按钮
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
              decoration: BoxDecoration(
                color: controller.changeShowButton()
                    ? Provider.of<ThemeColorsNotifier>(context).color
                    : Provider.of<ThemeColorsNotifier>(context).color.withAlpha(128),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: TextButton(
                style: controller.changeShowButton()
                    ? ButtonStyles.getButtonStyle()
                    : ButtonStyles.getTransparentStyle(),
                onPressed: () {
                  KeyboardUtils.hideKeyboard(context);
                  controller.login();
                },
                child: Text(
                  StringStyles.loginButton.tr,
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
