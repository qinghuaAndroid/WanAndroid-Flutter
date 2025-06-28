import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'widget/tabs_list_item.dart';

part 'tabs_list_controller.dart';

class TabsListPage extends GetSaveView<TabsListController> {
  final String id;

  @override
  get tag => id;

  const TabsListPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return RefreshWidget<TabsListController>(
      tag: tag,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.projectData.length,
        itemBuilder: (BuildContext context, int index) {
          return TabsListItem(
            tagType: controller.tagType,
            detail: controller.projectData[index],
            onResult: (value) {
              controller.projectData[index].collect = value;
            },
          );
        },
      ),
    );
  }
}
