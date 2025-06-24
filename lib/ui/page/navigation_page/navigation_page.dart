import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'navigation_controller.dart';
import 'widget/navigation_item_widget.dart';

class NavigationPage extends GetSaveView<NavigationController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStateWidget<NavigationController>(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 8.w,
        ),
        itemCount: controller.navigationList.length,
        itemBuilder: (context, index) {
          return NavigationItemWidget(
            item: controller.navigationList[index],
            onLabelTap: (detail) {
              WebUtil.toWebPage(detail);
            },
          );
        },
      ),
    );
  }
}
