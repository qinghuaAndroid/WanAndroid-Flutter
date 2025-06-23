import 'package:flutter/material.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'project_controller.dart';
import 'widget/project_list_item.dart';

/// @class : ProjectPage
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目 View层
class ProjectPage extends GetSaveView<ProjectController> {
  final String id;

  @override
  get tag => id;

  const ProjectPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return RefreshWidget<ProjectController>(
      tag: tag,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.projectData.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectListItem(controller.projectData[index], (value) {
            controller.projectData[index].collect = value;
          });
        },
      ),
    );
  }
}
