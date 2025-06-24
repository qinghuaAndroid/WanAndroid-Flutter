import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';

class TabsController extends BaseGetController {
  late TagType tagType;

  ///微信公众号列表
  List<WechatPublic> wechatPublic = [];

  ///项目类型
  List<ProjectTab> projectTabs = [];

  void requestData() {
    tagType == TagType.publicAccount ? getWechatPublic() : requestTabModule();
  }

  void getWechatPublic() {
    request.getWechatPublic(
      success: (data) {
        wechatPublic = data;
        update();
      },
    );
  }

  void requestTabModule() {
    request.requestTabModule(
      success: (data) {
        projectTabs.addAll(data);
        update();
      },
      fail: (code, msg) {},
    );
  }
}
