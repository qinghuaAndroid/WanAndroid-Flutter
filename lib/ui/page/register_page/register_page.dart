import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'register_controller.dart';
import 'widget/register_privacy_widget.dart';

/// @class : RegisterPage
/// @date : 2021/08/17
/// @name : jhf
/// @description :注册 View层
class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImagesLoginBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToolBar(
                backColor: Colors.white,
                backOnTap: () => Navigate.pop(),
                backgroundColor: Colors.transparent,
              ),

              ///logo及app名称
              const LogoNameWidget(),

              ///账户名输入框
              EditWidget(
                iconWidget: const Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                hintText: StringStyles.loginAccountNameHint.tr,
                onChanged: (text) => controller
                  ..account = text
                  ..update(),
              ),

              ///密码输入框
              EditWidget(
                iconWidget: const Icon(Icons.lock_open, color: Colors.white),
                hintText: StringStyles.loginAccountPwdHint.tr,
                passwordType: true,
                onChanged: (text) => controller
                  ..password = text
                  ..update(),
              ),

              ///再次输入密码输入框
              EditWidget(
                iconWidget: const Icon(Icons.lock_open, color: Colors.white),
                hintText: StringStyles.loginAccountRePwdHint.tr,
                passwordType: true,
                onChanged: (text) => controller
                  ..rePassword = text
                  ..update(),
              ),

              ///用户服务条款
              const RegisterPrivacyWidget(),

              ///注册按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                decoration: BoxDecoration(
                  color: controller.changeShowButton()
                      ? ColorStyle.color_24CF5F
                      : ColorStyle.color_24CF5F_20,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                        ? Styles.style_white_18
                        : Styles.style_white24_18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
