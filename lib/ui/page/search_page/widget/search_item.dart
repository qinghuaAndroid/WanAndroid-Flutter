import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : SearchHistoryItem
/// @date : 2021/9/6
/// @name : jhf
/// @description :搜索页面 搜索自适应item
class SearchHistoryItem extends StatelessWidget {
  final String name;

  ///点击事件
  final GestureTapCallback? onTap;

  const SearchHistoryItem({super.key, this.name = '', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.all(4),
        decoration: DecorationStyle.colorShadowRadius30(),
        child: Text(
          name,
          style: Styles.style_black_13,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
