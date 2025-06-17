import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : SearchPage
/// @date : 2021/9/7
/// @name : jhf
/// @description :搜索页面 搜索结果列表Item
class SearchResultItem extends StatelessWidget {
  ///列表数据
  final ProjectDetail item;

  const SearchResultItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var content = HtmlUtils.html2Title(item.title);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: DecorationStyle.colorShadowBorderStand(),
      child: Column(
        children: [
          Html(
            data: content,
            style: {
              'font': Style(
                fontSize: FontSize(15),
                fontWeight: FontWeight.w700,
              ),
            },
          ),
          Visibility(
            visible: item.desc.isNotEmpty,
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Html(data: item.desc),
            ),
          ),
          Box.vBox3,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Box.hBox6,
              Text(item.superChapterName, style: Styles.style_616169_11),
              Box.hBox10,
              const Text('|', style: Styles.style_9F9EA6_11),
              Box.hBox10,
              Text(
                item.shareUser.isEmpty ? item.author : item.shareUser,
                style: Styles.style_9F9EA6_11,
              ),
              Box.hBox10,
              Text(item.niceDate, style: Styles.style_9F9EA6_11),
            ],
          ),
          Box.vBox3,
        ],
      ),
    );
  }
}
