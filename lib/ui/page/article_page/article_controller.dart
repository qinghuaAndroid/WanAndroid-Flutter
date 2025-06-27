import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : ProjectController
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目 控制器层
class ArticleController extends BaseGetPageController {
  Map<String, dynamic> arguments = Get.arguments;

  List<ProjectDetail> projectData = [];

  @override
  int get initialPage =>
      arguments['articleType'] == ArticleType.question ? 1 : 0;

  ///请求积分明细
  @override
  void requestData(
    RefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    switch (arguments['articleType'] as ArticleType?) {
      case ArticleType.system:
        requestSystemArticles(controller, refresh);
        break;
      case ArticleType.question:
        requestAskModule(controller, refresh);
        break;
      case ArticleType.square:
        requestSquareModule(controller, refresh);
        break;
      case null:
        break;
    }
  }

  void requestSystemArticles(RefreshController controller, Refresh refresh) {
    request.requestSystemArticles(
      arguments["cid"].toString(),
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  void requestAskModule(RefreshController controller, Refresh refresh) {
    request.requestAskModule(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  void requestSquareModule(RefreshController controller, Refresh refresh) {
    request.requestSquareModule(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }
}
