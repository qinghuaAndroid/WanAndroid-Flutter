import 'package:flutter/material.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'ask_controller.dart';
import 'widget/ask_item_widget.dart';

/// @class : ProjectPage
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目 View层
class AskPage extends GetSaveView<AskController> {
  const AskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: RefreshWidget<AskController>(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.projectData.length,
            itemBuilder: (BuildContext context, int index) {
              return AskListItem(
                controller.projectData[index],
                onResult: (value) {
                  controller.projectData[index].collect = value;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
