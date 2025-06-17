import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'setting_controller.dart';

/// @class : SettingPage
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置 View层
class SettingPage extends GetCommonView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ToolBar(title: StringStyles.settingTitle.tr),
          DividerStyle.divider1Half,
          ListTile(
            onTap: () => Get.toNamed(Routes.settingLanguagePage),
            title: Text(StringStyles.settingLanguage.tr),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),

          ListTile(
            onTap: () => controller.clearCacheFile(),
            title: Text(StringStyles.settingCache.tr),
            trailing: Obx(
              () => Text(controller.cache.value, style: Styles.style_6A6969_14),
            ),
          ),

          DividerStyle.divider20Half,

          ListTile(
            onTap: () => controller.exitLoginState(),
            title: Container(
              alignment: Alignment.center,
              child: Text(StringStyles.settingExitLogin.tr),
            ),
          ),
        ],
      ),
    );
  }
}
