import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';

class PageStateWidget<T extends BaseGetController> extends StatefulWidget {
  final String? tag;

  final Widget child;

  const PageStateWidget({super.key, this.tag, required this.child});

  ///获取BaseGetController子类对象，在GetX中，任何BaseGetController都可以通过此方法获取
  ///但是必须是没有dispose的Controller
  T get controller => GetInstance().find<T>(tag: tag);

  @override
  State<PageStateWidget> createState() => _PageStateWidgetState();
}

class _PageStateWidgetState extends State<PageStateWidget> {
  @override
  Widget build(BuildContext context) {
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
              child: widget.child,
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
}
