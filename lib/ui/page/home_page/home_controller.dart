import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : MainController
/// @date : 2021/09/02
/// @name : jhf
/// @description :首页 控制器层
class HomeController extends BaseGetPageController {
  ///首页数据
  List<ProjectDetail> projectData = [];

  ///首页Banner轮播图
  List<Banners> banner = [];

  ///Banner轮播图控制器
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  void onInit() {
    super.onInit();
    getBanner();
  }

  ///请求首页项目数据
  @override
  void requestData(
    RefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    request.requestHomeArticle(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }

        projectData.addAll(data);
        showSuccess(projectData);

        ///为了防止动画每次都加载，所以只需要在第一次出现时加载一次
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  ///请求获取首页Banner图片
  void getBanner() {
    request.getBanner(
      success: (data) {
        ///添加自定义的积分排行榜图片
        banner.add(Banners(imagePath: R.assetsIntegralRanking, isAssets: true));
        banner.addAll(data);

        ///预缓存banner图片
        data.forEach((element) {
          if (Get.context != null) {
            precacheImage(NetworkImage(element.imagePath), Get.context!);
          }
        });
        update();
      },
    );
  }
}
