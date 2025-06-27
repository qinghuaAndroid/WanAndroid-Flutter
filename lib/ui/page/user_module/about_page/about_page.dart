import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/app/package_info.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'about_controller.dart';

/// @class : AboutPage
/// @date : 2021/08/25
/// @name : jhf
/// @description :关于我们 View层
class AboutPage extends GetCommonView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: StringStyles.aboutTitle.tr),
            Box.vBox30,
            Image.asset(assetImage('logo_green'), width: 120),
            Box.vBox12,
            Text(StringStyles.appName.tr, style: Styles.style_black_30),
            Box.vBox5,
            Text(
              '${StringStyles.aboutVersion.tr}${PackageInfo.versionName}',
              style: Styles.style_black_12,
            ),
            Box.vBox5,
            Text(
              '${StringStyles.aboutBuild.tr}${PackageInfo.versionCode}',
              style: Styles.style_black_12,
            ),
            Box.vBox30,

            ListTile(
              title: Text(StringStyles.aboutGithub.tr),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => WebUtil.toWebPageOther(
                title: StringStyles.aboutGithub.tr,
                link: Constant.githubLike,
              ),
            ),
            DividerStyle.divider1HalfPadding20,

            ListTile(
              title: Text(StringStyles.aboutSupport.tr),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => WebUtil.toWebPageOther(
                title: StringStyles.aboutSupport.tr,
                link: Constant.wanAndroidLike,
              ),
            ),
            DividerStyle.divider1HalfPadding20,

            const Expanded(child: Text('')),
          ],
        ),
      ),
    );
  }
}
