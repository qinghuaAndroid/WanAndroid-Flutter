import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'userinfo_controller.dart';
import 'widget/user_info_widget.dart';

/// @class : WebViewPage
/// @date : 2021/08/24
/// @name : jhf
/// @description :用户信息 View层
class UserInfoPage extends GetCommonView<UserInfoController> {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ToolBar(
            title: StringStyles.homeUserInfo.tr,
            backOnTap: () => Get.back(),
          ),

          ///头像
          Container(
            margin: const EdgeInsets.only(top: 24),
            decoration: ShadowStyle.black12Circle40(),
            child: HeadCircleWidget(width: 72, height: 72),
          ),
          Box.vBox20,

          UserInfoWidget(
            keys: StringStyles.userNickname.tr,
            value: controller.userInfo.nickname,
          ),

          DividerStyle.divider1HalfPadding20,
        ],
      ),
    );
  }
}
