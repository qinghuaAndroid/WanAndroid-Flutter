import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/src/base_page_controller.dart';
import 'package:wan_android_flutter/res/res.dart';

import 'over_scroll_behavior.dart';

///刷新状态
enum Refresh {
  ///初次进入页面加载
  first,

  ///上拉加载
  pull,

  ///下拉加载
  down,
}

/// @class : RefreshWidget
/// @date : 2021/08/26
/// @name : jhf
/// @description :上拉刷新、下拉加载、空白页加载动画
/// 通过在基类BaseGetController中维护上拉刷新、下拉加载、控制器等等状态
/// 不需要暴露给使用者，当然，此方法只能使用Getx框架有效
class RefreshWidget<T extends BaseGetPageController> extends StatefulWidget {
  const RefreshWidget({
    super.key,
    this.enablePullUp = true,
    this.enablePullDown = true,
    this.onRefresh,
    this.onLoadMore,
    required this.child,
  });

  final String? tag = null;

  ///获取BaseGetController子类对象，在GetX中，任何BaseGetController都可以通过此方法获取
  ///但是必须是没有dispose的Controller
  T get controller => GetInstance().find<T>(tag: tag);

  ///是否启用上拉
  final bool enablePullUp;

  ///是否启用下拉
  final bool enablePullDown;

  ///下拉刷新回调
  final VoidCallback? onRefresh;

  ///上拉加载回调
  final VoidCallback? onLoadMore;

  ///子类，必须是ListView
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return RefreshWidgetState();
  }
}

///   with AutomaticKeepAliveClientMixin
class RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  ///内部维护[RefreshController] ，不暴露出去 , 上下刷新控制器
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    widget.controller.initPullLoading(refreshController);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ///上下刷新、下拉加载控件
          Obx(
            () => Visibility(
              visible: widget.controller.loadState.value == 1,
              child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullDown: widget.enablePullDown,
                  enablePullUp: widget.enablePullUp,
                  onRefresh: () =>
                      widget.controller.onLoadRefresh(refreshController),
                  onLoading: () =>
                      widget.controller.onLoadMore(refreshController),
                  header: CustomHeader(
                    builder: (BuildContext context, RefreshStatus? mode) {
                      Widget header;
                      if (mode == RefreshStatus.idle) {
                        ///下拉时显示
                        header = Text(
                          StringStyles.refreshHeaderIdle.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      } else if (mode == RefreshStatus.refreshing) {
                        ///加载中
                        header = Lottie.asset(
                          R.assetsLottieRefreshHeader,
                          width: 100,
                          animate: true,
                        );
                      } else if (mode == RefreshStatus.failed) {
                        ///加载失败
                        header = Text(
                          StringStyles.refreshHeaderFailed.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      } else if (mode == RefreshStatus.completed) {
                        ///加载成功
                        header = Text(
                          StringStyles.refreshHeaderSuccess.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      } else {
                        ///超过二层
                        header = Text(
                          StringStyles.refreshHeaderFreed.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      }
                      return SizedBox(height: 64, child: Center(child: header));
                    },
                  ),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget footer;
                      if (mode == LoadStatus.idle) {
                        ///下拉提示
                        footer = const Text("pull up load");
                      } else if (mode == LoadStatus.loading) {
                        ///加载中
                        footer = Lottie.asset(
                          R.assetsLottieRefreshFooter,
                          width: 200,
                          animate: true,
                        );
                      } else if (mode == LoadStatus.failed) {
                        ///加载失败
                        footer = Text(
                          StringStyles.refreshError.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      } else {
                        ///无更多数据
                        footer = Text(
                          StringStyles.refreshNoData.tr,
                          style: Styles.style_B8C0D4_14,
                        );
                      }
                      return SizedBox(height: 60, child: Center(child: footer));
                    },
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),

          ///未加载前显示的动画，加载之后需要隐藏
          Obx(
            () => Visibility(
              visible: widget.controller.loadState.value == 0,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  R.assetsLottiePageLoading,
                  width: 200,
                  height: 200,
                  animate: true,
                ),
              ),
            ),
          ),

          ///加载数据为空的页面
          Obx(
            () => Visibility(
              visible: widget.controller.loadState.value == 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    R.assetsLottieRefreshEmpty,
                    width: 200,
                    animate: true,
                    repeat: false,
                  ),
                  Text(
                    StringStyles.refreshEmpty.tr,
                    style: Styles.style_B8C0D4_13,
                  ),
                ],
              ),
            ),
          ),

          ///加载出错的页面
          Obx(
            () => Visibility(
              visible: widget.controller.loadState.value == 3,
              child: Lottie.asset(
                R.assetsLottieRefreshError,
                width: 200,
                animate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
