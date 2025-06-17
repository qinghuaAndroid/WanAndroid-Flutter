import 'package:flutter/material.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'square_controller.dart';
import 'widget/square_article_item.dart';

/// @class : SquarePage
/// @date : 2021/9/9
/// @name : jhf
/// @description :广场 View层
class SquarePage extends GetSaveView<SquareController> {
  const SquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: RefreshWidget<SquareController>(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.projectData.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                color: Colors.transparent,
                child: Ripple(
                  onTap: () => WebUtil.toWebPage(
                    controller.projectData[index],
                    onResult: (value) {
                      controller.projectData[index].collect = value;
                    },
                  ),
                  child: SquareArticleItem(item: controller.projectData[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
