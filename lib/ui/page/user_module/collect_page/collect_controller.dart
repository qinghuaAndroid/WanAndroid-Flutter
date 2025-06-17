import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : CollectController
/// @date : 2021/08/27
/// @name : jhf
/// @description :我的收藏 控制器层
class CollectController extends BaseGetPageController {
  ///积分数据
  List<CollectDetail> collectList = [];

  ///请求积分明细
  @override
  void requestData(
    RefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    request.collectDetail(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          collectList.clear();
        }
        collectList.addAll(data);
        showSuccess(collectList);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  ///取消收藏单个
  ///[index] 索引
  void notifyPart(int index) {
    collectList.removeAt(index);
    update();
  }
}
