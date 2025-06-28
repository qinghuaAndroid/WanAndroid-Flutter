import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class TabsListItem extends StatelessWidget {
  final TagType tagType;
  final ProjectDetail detail;
  final Function(bool) onResult;

  const TabsListItem({
    super.key,
    required this.tagType,
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
        child: tagType == TagType.project
            ? _ProjectListItem(detail: detail)
            : _PublicListItem(detail: detail),
      ),
    );
  }
}

///項目tabs
class _ProjectListItem extends StatelessWidget {
  final ProjectDetail detail;

  const _ProjectListItem({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///标题
              Text(
                detail.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Styles.style_black_16_bold,
              ),
              Box.vBox10,

              ///部分内容
              Text(
                detail.desc,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Styles.style_6A6969_14,
              ),
              Box.vBox10,

              ///作者
              Row(
                children: [
                  SvgPicture.asset(R.assetsImagesProgram, width: 16),
                  Box.hBox10,
                  Text(
                    detail.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.style_6A6969_14,
                  ),
                ],
              ),
              Box.vBox10,

              ///发布时间
              Row(
                children: [
                  SvgPicture.asset(R.assetsImagesDateTime, width: 16),
                  Box.hBox10,
                  Text(
                    detail.niceDate,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.style_6A6969_14,
                  ),
                ],
              ),
            ],
          ),
        ),
        Box.hBox5,
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            detail.envelopePic,
            fit: BoxFit.fill,
            width: 72,
            height: 128,
          ),
        ),
      ],
    );
  }
}

///微信公众号tabs
class _PublicListItem extends StatelessWidget {
  final ProjectDetail detail;

  const _PublicListItem({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///作者
        Row(
          children: [
            SvgPicture.asset(R.assetsImagesProgram, width: 16),
            Box.hBox10,
            Text(
              detail.author,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.style_6A6969_14,
            ),
          ],
        ),
        Box.vBox10,

        ///标题
        Text(
          detail.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.style_black_16_bold,
        ),
        Box.vBox10,

        ///发布时间
        Row(
          children: [
            SvgPicture.asset(R.assetsImagesDateTime, width: 16),
            Box.hBox10,
            Text(
              detail.niceDate,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.style_6A6969_14,
            ),
          ],
        ),
        Box.vBox10,
      ],
    );
  }
}
