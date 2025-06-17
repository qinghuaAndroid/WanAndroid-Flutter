import 'package:get/get.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @class : WebViewController
/// @date : 2021/08/24
/// @name : jhf
/// @description : WebView 控制器层
class WebController extends BaseGetController {
  ///加载URL
  WebEntity detail = Get.arguments;

  ///进度条
  var progress = 0.0.obs;

  ///是否点赞
  var isCollect = false.obs;

  ///控制收藏的取消与结束
  var collectAtState = false.obs;

  final webViewController = WebViewController();

  @override
  void onInit() {
    super.onInit();
    isCollect.value = detail.isCollect;
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            this.progress.value = progress.toDouble();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(detail.link));
  }

  ///收藏&取消收藏
  ///注意此处，从收藏进入取消收藏的ID是originId
  collectArticle() {
    if (!isCollect.value) {
      collectAtState.value = true;
      Future.delayed(const Duration(milliseconds: 900)).then((value) {
        collectAtState.value = false;
      });
    }

    request.collectArticle(
      isCollect.value && detail.originId != 0 ? detail.originId : detail.id,
      isCollect: isCollect.value,
      success: (data) {
        ToastUtils.show(
          isCollect.value
              ? StringStyles.collectQuit.tr
              : StringStyles.collectSuccess.tr,
        );
        isCollect.value = !isCollect.value;
        update();
      },
    );
  }
}
