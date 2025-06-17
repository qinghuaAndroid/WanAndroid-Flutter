import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : ProjectListItem
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目列表item widget
class AskListItem extends StatelessWidget {
  final ProjectDetail detail;

  final Function(bool)? onResult;

  const AskListItem(this.detail, {super.key, this.onResult});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WebUtil.toWebPage(detail, onResult: onResult),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: ColorStyle.color_EFF1F8),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.style_black_16_bold,
                  ),
                  Box.vBox10,

                  Row(
                    children: [
                      HeadCircleWidget(width: 22, height: 22),
                      Box.hBox5,
                      Text(
                        detail.shareUser.isEmpty
                            ? detail.author
                            : detail.shareUser,
                        style: Styles.style_B8C0D4_13,
                      ),
                      Box.hBox15,
                      Text(detail.niceDate, style: Styles.style_B8C0D4_13),
                    ],
                  ),
                ],
              ),
            ),
            Box.hBox5,
          ],
        ),
      ),
    );
  }
}
