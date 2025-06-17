import 'package:get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : WebUtil
/// @date : 2021/9/14
/// @name : jhf
/// @description :Web工具类
class WebUtil {
  ///普通页面进入Web页面1
  static toWebPage(ProjectDetail detail, {Function(bool)? onResult}) {
    Navigate.push(
      Routes.webViewPage,
      arguments: WebEntity(
        title: detail.title,
        link: detail.link,
        id: detail.id,
        isCollect: detail.collect,
      ),
    )?.then((value) async {
      if (value is bool && onResult != null) {
        onResult(value);
      }
    });

    ///存储浏览记录
    SpUtil.saveBrowseHistory(detail);
  }

  ///收藏页面进入Web页面2
  static Future<dynamic>? toWebPageCollect(CollectDetail detail) {
    return Navigate.push(
      Routes.webViewPage,
      arguments: WebEntity(
        title: detail.title,
        link: detail.link,
        id: detail.id,
        originId: detail.originId,
        isCollect: true,
      ),
    );
  }

  ///普通页面进入Web页面2
  static toWebPageBanners(Banners detail) {
    Navigate.push(
      Routes.webViewPage,
      arguments: WebEntity(
        title: detail.title,
        link: detail.url,
        id: 0,
        isCollect: false,
      ),
    );
  }

  ///其他页面进入Web页面2
  static toWebPageOther({String title = '', String link = ''}) {
    Navigate.push(
      Routes.webViewPage,
      arguments: WebEntity(title: title, link: link, id: 0, isCollect: false),
    );
  }
}
