import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class ArticleListItem extends StatelessWidget {
  final ProjectDetail detail;
  final Function(bool) onResult;

  const ArticleListItem({
    super.key,
    required this.detail,
    required this.onResult,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Box.vBox10,
            Text(
              detail.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.style_black_16_bold,
            ),
            Box.vBox5,
            Row(
              children: [
                Text(
                  detail.author.isNotEmpty ? detail.author : detail.shareUser,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Styles.style_6A6969_14,
                ),
                Box.hBox10,
                Text(
                  detail.author.isNotEmpty
                      ? detail.niceDate
                      : detail.niceShareDate,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Styles.style_6A6969_14,
                ),
              ],
            ),
            Box.vBox10,
          ],
        ),
      ),
    );
  }
}
