import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_controller.dart';
import 'widget/webview_bottom_widget.dart';

/// @class : WebViewPage
/// @date : 2021/08/24
/// @name : jhf
/// @description :WebView View层
class WebViewPage extends GetCommonView<WebController> {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /// 拦截用户返回，返回时携带参数
        Get.back(result: controller.isCollect.value);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                ToolBar(
                  backOnTap: () => Get.back(result: '${controller.isCollect}'),
                  title: controller.detail.title,
                ),
                Positioned(
                  right: 20,
                  bottom: 11,
                  width: 24,
                  height: 24,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      splashColor: ColorStyle.color_E2E3E8_66,
                      onTap: () {
                        SharePlus.instance.share(
                          ShareParams(
                            text:
                                controller.detail.title +
                                controller.detail.link,
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        R.assetsImagesShare,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: controller.webViewController),
                  Obx(
                    () => Visibility(
                      visible: controller.collectAtState.value,
                      child: Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Lottie.asset(
                          R.assetsLottieCollect,
                          animate: controller.collectAtState.value,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.progress < 1,
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        backgroundColor: ColorStyle.color_F9F9F9,
                        color: ColorStyle.color_24CF5F,
                        value: controller.progress.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.detail.id > 0,
              child: const WebViewBottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
