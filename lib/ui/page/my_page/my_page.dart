import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'my_controller.dart';
import 'widget/title_content_widget.dart';

/// @class : MyPage
/// @date : 2021/08/20
/// @name : jhf
/// @description :我的 View层
class MyPage extends GetSaveView<MyController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: kTextTabBarHeight + 6),
      child: Column(
        children: [
          Row(
            children: [
              ///头像
              GestureDetector(
                onTap: () => Navigate.push(Routes.userInfoPage),
                child: Container(
                  margin: const EdgeInsets.only(left: 24),
                  decoration: ShadowStyle.black12Circle40(),
                  child: HeadCircleWidget(width: 72, height: 72),
                ),
              ),

              ///用户名称
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  controller.userInfo.nickname,
                  style: Styles.style_1A2F51_18,
                ),
              ),

              ///占位
              const Expanded(
                child: Text(''), // 中间用Expanded控件
              ),

              ///设置
              GestureDetector(
                onTap: () => Navigate.push(Routes.settingPage),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Container(
                    color: ColorStyle.color_F3F3F3,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: const Icon(Icons.settings),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            decoration: ShadowStyle.white12Circle(),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              direction: Axis.horizontal,
              children: [
                ///收藏数量
                Expanded(
                  flex: 1,
                  child: TitleContentWidget(
                    title: StringStyles.homeCollect.tr,
                    content: controller.userInfo.collectIds.length.toString(),
                    onTap: () => Navigate.push(Routes.collectPage),
                  ),
                ),

                ///分享列表
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => TitleContentWidget(
                      title: StringStyles.homePartake.tr,
                      content: '${controller.share}',
                      onTap: () => Navigate.push(Routes.sharePage),
                    ),
                  ),
                ),

                ///积分
                Expanded(
                  flex: 1,
                  child: TitleContentWidget(
                    title: StringStyles.homePoints.tr,
                    content: controller.userInfo.coinCount.toString(),
                    onTap: () => Navigate.push(Routes.pointsPage),
                  ),
                ),

                ///历史
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => TitleContentWidget(
                      title: StringStyles.homeHistory.tr,
                      content: '${controller.browseHistory.value}',
                      onTap: () => Navigate.push(Routes.historyPage),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
            decoration: ShadowStyle.white12Circle(),
            child: Column(
              children: [
                ///积分排行榜
                GestureDetector(
                  onTap: () => Navigate.push(Routes.rankingPage),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.volume_down,
                          size: 20,
                          color: ColorStyle.color_24CF5F,
                        ),
                        Box.hBox3,
                        Text(
                          StringStyles.userPointsRanking.tr,
                          style: Styles.style_B8C0D4_13,
                        ),
                      ],
                    ),
                  ),
                ),

                ///个人信息
                IconTitleWidget(
                  icon: Icons.perm_identity,
                  text: StringStyles.homeUserInfo.tr,
                  endColor: Colors.black54,
                  onTap: () => Navigate.push(Routes.userInfoPage),
                ),

                ///关于
                IconTitleWidget(
                  icon: Icons.info_outline,
                  text: StringStyles.homeAbout.tr,
                  endColor: Colors.black54,
                  onTap: () => Navigate.push(Routes.aboutPage),
                ),

                ///分享
                IconTitleWidget(
                  icon: Icons.share,
                  text: StringStyles.homeShare.tr,
                  endColor: Colors.black45,
                  onTap: () {
                    SmartDialog.show(
                      builder: (BuildContext context) {
                        return ShareDialog(url: Constant.downloadUrl);
                      },
                    );
                  },
                ),

                ///问题反馈
                IconTitleWidget(
                  icon: Icons.feedback_outlined,
                  text: StringStyles.homeFeedback.tr,
                  endColor: Colors.black45,
                  onTap: () => Navigate.push(Routes.feedbackPage),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
