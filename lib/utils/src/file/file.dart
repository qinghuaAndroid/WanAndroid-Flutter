import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/src/toast_util.dart';

/// @class : FileUtils
/// @date : 2021/10/27
/// @name : jhf
/// @description :文件管理类
class FileUtils {
  ///保存assets图片到本地
  ///[assets] assets路径
  ///[target] 目标路径
  static saveAssetsGallery({String assets = '', String target = ''}) async {
    ByteData bytes = await rootBundle.load(assets);
    final result = await ImageGallerySaverPlus.saveImage(
      bytes.buffer.asUint8List(),
    );
    ToastUtils.show(StringStyles.saveSuccess.tr);
  }
}
