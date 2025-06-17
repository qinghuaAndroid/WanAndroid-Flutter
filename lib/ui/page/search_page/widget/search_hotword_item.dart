import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : SearchHotWordItem
/// @date : 2021/9/8
/// @name : jhf
/// @description :搜索页面 热搜榜列表Item
class SearchHotWordItem extends StatelessWidget {
  ///列表数据
  final HotWord item;

  ///索引
  final int index;

  const SearchHotWordItem({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: DecorationStyle.customize(getBgColor(), 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Text(
              '$index',
              style: index > 3 ? Styles.style_black_12 : Styles.style_white_12,
            ),
          ),
        ),
        Box.hBox5,
        Text(
          item.name,
          overflow: TextOverflow.ellipsis,
          style: Styles.style_black_14,
        ),
        Box.hBox3,
        Visibility(
          visible: index <= 3,
          child: SvgPicture.asset(R.assetsImagesHotWordItem, width: 15),
        ),
      ],
    );
  }

  ///获取热搜榜中的背景
  Color getBgColor() {
    switch (index) {
      case 1:
        return Colors.red;
      case 2:
        return ColorStyle.color_FE8C28;
      case 3:
        return ColorStyle.color_FFAE2E;
      default:
        return ColorStyle.colorShadow;
    }
  }
}
