import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : PointsItemWidget
/// @date : 2021/08/25
/// @name : jhf
/// @description :ListView item
class PointsItemWidget extends StatelessWidget {
  ///排名信息
  final Points points;

  const PointsItemWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: ColorStyle.colorShadow),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Box.hBox15,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Box.hBox15,
                Text(points.reason, style: Styles.style_black_16),
                Box.vBox3,
                Text(
                  DateUtil.milliseconds2Date(points.date),
                  style: Styles.style_B8C0D4_13,
                ),
              ],
            ),
          ),

          Text('+${points.coinCount}', style: Styles.style_FE8C28_24_bold),
          Box.hBox5,
          SvgPicture.asset(R.assetsImagesPoints, width: 22),
          Box.hBox15,
        ],
      ),
    );
  }
}
