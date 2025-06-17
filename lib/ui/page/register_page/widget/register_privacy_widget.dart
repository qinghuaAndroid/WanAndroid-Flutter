import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/ui/page/register_page/register_controller.dart';

/// @class : RegisterPrivacyWidget
/// @date : 2021/08/18
/// @name : jhf
/// @description :注册 用户服务条款
class RegisterPrivacyWidget extends GetCommonView<RegisterController> {
  const RegisterPrivacyWidget({super.key});

  @override
  get updateId => "isCheckPrivacy";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Checkbox(
            value: controller.isCheckPrivacy,
            checkColor: Colors.white,
            fillColor: WidgetStateProperty.all(ColorStyle.color_24CF5F),
            onChanged: (select) {
              controller.updateCheck();
            },
          ),
          Text(
            StringStyles.registerServiceTerms.tr,
            style: Styles.style_white_14,
          ),
        ],
      ),
    );
  }
}
