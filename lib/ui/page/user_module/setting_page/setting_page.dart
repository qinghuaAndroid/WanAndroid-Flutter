import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/router_reporter.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'setting_controller.dart';

class SettingPage extends StatefulWidget {
  final String? tag;

  const SettingPage({super.key, this.tag});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with RouteAware, WidgetsBindingObserver {
  
  SettingController get controller =>
      GetInstance().find<SettingController>(tag: widget.tag);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('---------->didChangeAppLifecycleState: $state');
  }

  @override
  void didPush() {
    super.didPush();
    debugPrint('---------->didPush');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    debugPrint('---------->didPushNext');
  }

  @override
  void didPop() {
    super.didPop();
    debugPrint('---------->didPop');
  }

  @override
  void didPopNext() {
    super.didPopNext();
    debugPrint('---------->didPopNext');
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    Get.delete<SettingController>(tag: widget.tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      tag: widget.tag,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              ToolBar(title: StringStyles.settingTitle.tr),
              DividerStyle.divider1Half,
              ListTile(
                onTap: () => Navigate.push(Routes.settingLanguagePage),
                title: Text(StringStyles.settingLanguage.tr),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),

              ListTile(
                onTap: () => controller.clearCacheFile(),
                title: Text(StringStyles.settingCache.tr),
                trailing: Obx(
                  () => Text(
                    controller.cache.value,
                    style: Styles.style_6A6969_14,
                  ),
                ),
              ),

              ListTile(
                onTap: () => Navigate.push(Routes.settingThemeColors),
                title: Text(StringStyles.settingThemeColors.tr),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),

              DividerStyle.divider20Half,

              ListTile(
                onTap: () => controller.exitLoginState(),
                title: Container(
                  alignment: Alignment.center,
                  child: Text(StringStyles.settingExitLogin.tr),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
