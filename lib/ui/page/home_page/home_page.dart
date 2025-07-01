import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'home_controller.dart';
import 'widget/banner_widget.dart';
import 'widget/home_article_item.dart';

/// @class : HomePage
/// @date : 2021/08/23
/// @name : jhf
/// @description :首页 View层
class HomePage extends GetSaveView<HomeController> {
  const HomePage({super.key});

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
                child: RefreshWidget<HomeController>(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.projectData.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      ///将Banner装载到ListView中
                      if (index == 0) {
                        return SizedBox(
                          width: double.infinity,
                          height: 215.w,
                          child: BannerWidget(
                            controller.banner,
                            height: 215.w,
                            onTap: (index) {
                                WebUtil.toWebPageBanners(
                                  controller.banner[index],
                                );
                            },
                          ),
                        );
                      } else {
                        ///计算当前显示的真实索引
                        var newIndex = index - 1;

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
                            child: HomeArticleItem(
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
