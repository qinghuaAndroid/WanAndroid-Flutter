import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/ui/page/search_page/search_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'search_result_item.dart';

/// @class : SearchPage
/// @date : 2021/9/7
/// @name : jhf
/// @description :搜索页面 搜索结果
class SearchResultWidget extends GetCommonView<SearchController> {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.showResult.value,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: RefreshWidget<SearchController>(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  color: Colors.transparent,
                  child: Ripple(
                    onTap: () => WebUtil.toWebPage(
                      controller.searchResult[index],
                      onResult: (value) {
                        controller.searchResult[index].collect = value;
                      },
                    ),
                    child: SearchResultItem(
                      item: controller.searchResult[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
