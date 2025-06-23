import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/ui/page/system_page/widget/system_item_widget.dart';

import 'system_controller.dart';

class SystemPage extends GetSaveView<SystemController> {
  const SystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.w),
      itemCount: controller.systems.length,
      itemBuilder: (context, index) {
        return SystemItemWidget(
          item: controller.systems[index],
          onLabelTap: (children) {},
        );
      },
    );
  }
}
