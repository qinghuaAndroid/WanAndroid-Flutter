import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/model/language.dart';
import 'package:wan_android_flutter/util/save/sp_util.dart';

/// @class : LocaleOptions
/// @date : 2021/08/26
/// @name : jhf
/// @description :语言工具类
class LocalOptions {
  ///更新语言
  static updateLocal(Language language) {
    Locale? locale;
    if (language.language == '' || language.country == '') {
      locale = Get.deviceLocale;
    } else {
      locale = Locale(language.language, language.country);
    }

    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  ///获取当前存储的默认语言
  static getDefault() {
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      return Get.deviceLocale;
    } else {
      return Locale(language.language, language.country);
    }
  }
}
