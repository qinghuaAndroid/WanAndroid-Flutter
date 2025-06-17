import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

class RefreshExtension {
  ///刷新加载失败
  ///[controller] RefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  static onError(RefreshController controller, Refresh refresh) {
    if (refresh == Refresh.pull) {
      controller.refreshFailed();
    } else if (refresh == Refresh.down) {
      controller.loadFailed();
    }
  }

  ///刷新加载成功
  ///[controller] RefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  ///[over] 是否为最后一页
  static onSuccess(RefreshController controller, Refresh refresh, bool over) {
    ///加载成功，重置刷新状态
    if (refresh == Refresh.pull) {
      controller.refreshCompleted();
    } else if (refresh == Refresh.down) {
      controller.loadComplete();
    }

    ///最后一页了，无更多数据
    if (over) {
      controller.loadNoData();
    } else {
      controller.loadComplete();
    }
    if (refresh == Refresh.pull) {
      ToastUtils.show(StringStyles.pointsNotifySuccess.tr);
    }
  }
}
