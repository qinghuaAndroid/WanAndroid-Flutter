import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : SettingLanguagePage
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置语言页面
class SettingLanguagePage extends StatefulWidget {
  const SettingLanguagePage({super.key});

  @override
  State<SettingLanguagePage> createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  ///应用支持的语言
  List<Language> language = languageList;

  @override
  void initState() {
    super.initState();

    ///读取语言存储
    var languageModel = SpUtil.getLanguage();
    if (languageModel == null) {
      language[0].isSelect = true;
    } else {
      ///找到当前选中的语言
      for (var item in language) {
        if (item.name == languageModel.name) {
          item.isSelect = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: StringStyles.settingLanguage.tr),
            DividerStyle.divider1Half,
            ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: language.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      ///更新语言
                      language
                        ..forEach((item) {
                          item.isSelect = false;
                        })
                        ..[index].isSelect = true;
                      SpUtil.updateLanguage(language[index]);
                      LocaleUtil.updateLocale(language[index]);
                      Get.back();
                    },
                    title: Text(language[index].name),
                    trailing: Visibility(
                      visible: language[index].isSelect,
                      child: const Icon(
                        Icons.radio_button_checked,
                        color: ColorStyle.color_24CF5F,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
