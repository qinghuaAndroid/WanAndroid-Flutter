import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class SystemItemWidget extends StatelessWidget {
  final SystemEntity item;
  final ParamSingleCallback<Children> onLabelTap;

  const SystemItemWidget({
    super.key,
    required this.item,
    required this.onLabelTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.w),
        Text(item.name, style: Styles.style_1A2F51_14),
        SizedBox(height: 8.w),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.w,
          children: item.children.map((e) {
            return GestureDetector(
              onTap: () {
                onLabelTap.call(e);
              },
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 8.w,
                  vertical: 4.w,
                ),
                decoration: DecorationStyle.customize(
                  ColorStyle.color_E2E3E8_66,
                  1.w,
                ),
                child: Text(e.name, style: Styles.style_9F9EA6_12),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 8.w),
      ],
    );
  }
}
