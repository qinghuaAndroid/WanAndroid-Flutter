import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'points_controller.dart';
import 'widget/points_item_widget.dart';

/// @class : PointsPage
/// @date : 2021/08/25
/// @name : jhf
/// @description :积分明细 View层
class PointsPage extends GetCommonView<PointsController> {
  const PointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: StringStyles.pointsDetailTitle.tr),
            DividerStyle.divider1HalfPadding20,

            ///积分列表
            Expanded(
              child: RefreshWidget<PointsController>(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.pointsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PointsItemWidget(
                      points: controller.pointsList[index],
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
