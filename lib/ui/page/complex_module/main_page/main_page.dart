import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'main_controller.dart';
import 'widget/banner_widget.dart';
import 'widget/main_article_item.dart';
import 'widget/main_wechat_public_widget.dart';

/// @class : MainPage
/// @date : 2021/08/23
/// @name : jhf
/// @description :首页 View层
class MainPage extends GetSaveView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: RefreshWidget<MainController>(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount:
                        controller.projectData.length +
                        1 +
                        (controller.insertIndex == -1 ? 0 : 1),
                    itemBuilder: (BuildContext context, int index) {
                      ///将Banner装载到ListView中
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          width: double.infinity,
                          height: 140,
                          child: BannerWidget(
                            controller.banner,
                            height: 140,
                            onTap: (index) {
                              if (index == 0) {
                                Navigate.push(Routes.rankingPage);
                              } else {
                                WebUtil.toWebPageBanners(
                                  controller.banner[index],
                                );
                              }
                            },
                          ),
                        );
                      } else if (index == controller.insertIndex) {
                        ///随机出现的公众号列表
                        return Obx(
                          () => WechatPublicWidget(
                            isFirst: controller.isFirst,
                            wechatPublic: controller.showWechatPublic,
                            onChange: () => controller.notifyRandomPublic(),
                            showSwitch: controller.showSwitch.value,
                            showDelete: controller.showDelete.value,
                            onTap: () => controller.notifyButtonState(),
                          ),
                        );
                      } else {
                        ///计算当前显示的真实索引
                        var newIndex =
                            index -
                            (index > controller.insertIndex &&
                                    controller.insertIndex != -1
                                ? 2
                                : 1);

                        ///item列表数据展示
                        return Material(
                          color: Colors.transparent,
                          child: Ripple(
                            onTap: () => WebUtil.toWebPage(
                              controller.projectData[newIndex],
                              onResult: (value) {
                                controller.projectData[newIndex].collect =
                                    value;
                              },
                            ),
                            child: MainArticleItem(
                              item: controller.projectData[newIndex],
                              index: newIndex,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
