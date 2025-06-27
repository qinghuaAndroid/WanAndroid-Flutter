import 'package:get/get.dart';
import 'package:wan_android_flutter/ui/page/article_page/article_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}
