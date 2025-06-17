import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'ranking_controller.dart';
import 'widget/ranking_item_widget.dart';
import 'widget/ranking_title_widget.dart';

/// @class : RankingPage
/// @date : 2021/08/24
/// @name : jhf
/// @description :用户信息 View层
class RankingPage extends GetCommonView<RankingController> {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.color_FBE240,
      body: Column(
        children: [
          ToolBar(
            backgroundColor: Colors.transparent,
            backColor: Colors.white,
            backOnTap: () => Get.back(),
          ),
          Image.asset(R.assetsIntegralRanking),
          Expanded(
            ///排行榜样式
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 50,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular((25)),
              ),
              child: Column(
                children: [
                  ///顶部背景标题
                  const RankingTitleWidget(),

                  ///列表
                  Expanded(
                    child: RefreshWidget<RankingController>(
                      enablePullDown: false,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.rankingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RankingItemWidget(
                            ranking: controller.rankingList[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
