import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'system_controller.dart';
import 'widget/system_item_widget.dart';

class SystemPage extends GetSaveView<SystemController> {
  const SystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStateWidget<SystemController>(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 8.w,
        ),
        itemCount: controller.systems.length,
        itemBuilder: (context, index) {
          return SystemItemWidget(
            item: controller.systems[index],
            onLabelTap: (children) {},
          );
        },
      ),
    );
  }
}
