import 'package:get/get.dart';

import 'feedback_controller.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }
}
