import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : RankingController
/// @date : 2021/08/24
/// @name : jhf
/// @description :积分排行榜 控制器层
class RankingController extends BaseGetPageController {
  ///排行榜源数据
  List<Ranking> rankingList = [];

  ///请求积分明细
  @override
  void requestData(
    RefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    request.rankingPoints(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          rankingList.clear();
        }
        rankingList.addAll(data);
        showSuccess(rankingList);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }
}
