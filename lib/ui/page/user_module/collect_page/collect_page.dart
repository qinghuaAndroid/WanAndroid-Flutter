import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'collect_controller.dart';
import 'widget/collect_item_widget.dart';

/// @class : CollectPage
/// @date : 2021/08/27
/// @name : jhf
/// @description :我的收藏 View层
class CollectPage extends GetCommonView<CollectController> {
  const CollectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: StringStyles.collectTitle.tr),
            DividerStyle.divider1HalfPadding20,

            ///积分列表
            Expanded(
              child: RefreshWidget<CollectController>(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.collectList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CollectItemWidget(
                      collect: controller.collectList[index],
                      result: () => controller.notifyPart(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
