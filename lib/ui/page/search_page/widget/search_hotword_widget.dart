import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/ui/page/search_page/search_controller.dart';

import 'search_hotword_item.dart';

/// @class : SearchHotWordWidget
/// @date : 2021/9/6
/// @name : jhf
/// @description :搜索页面 搜索热词
class SearchHotWordWidget extends GetCommonView<SearchController> {
  const SearchHotWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Box.hBox20,
            Text(
              StringStyles.searchHotWord.tr,
              style: Styles.style_black_16_bold500,
            ),
            SvgPicture.asset(R.assetsImagesHotWord, width: 16),
            Box.hBox20,
            Expanded(child: Container()),
          ],
        ),
        Box.vBox5,
        Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.hotWord.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => controller.hotOrHistorySearch(
                    controller.hotWord[index].name,
                  ),
                  child: SearchHotWordItem(
                    item: controller.hotWord[index],
                    index: index + 1,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
