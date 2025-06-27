import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/model/models.dart' hide ProjectPage;
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/ui/page/project_page/project_controller.dart';
import 'package:wan_android_flutter/ui/page/project_page/project_page.dart';
import 'package:wan_android_flutter/ui/page/tabs_page/tabs_controller.dart';

class TabsPage extends StatefulWidget {
  final TagType tagType;

  const TabsPage({super.key, required this.tagType});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with AutomaticKeepAliveClientMixin<TabsPage>, TickerProviderStateMixin {
  String? tag;
  late TabsController controller;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tag = widget.tagType.toString();
    controller = GetInstance().find<TabsController>(tag: tag);
    controller.tagType = widget.tagType;
    controller.requestData();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<TabsController>(tag: tag);
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<TabsController>(
      tag: tag,
      builder: (controller) {
        tabController = TabController(
          length: widget.tagType == TagType.publicAccount
              ? controller.wechatPublic.length
              : controller.projectTabs.length,
          vsync: this,
        );
        return SafeArea(
          top: true,
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Provider.of<ThemeColorsNotifier>(context).color,
                ),
                child: _tabBar(tabController),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: _createTabsPage(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TabBar _tabBar(TabController? tabController) {
    return TabBar(
      tabs: _tabs(),
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelPadding: const EdgeInsets.all(0.0),
      indicatorPadding: const EdgeInsets.all(0.0),
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
    );
  }

  List<Tab> _tabs() {
    return widget.tagType == TagType.publicAccount
        ? (controller.wechatPublic).map((model) {
            return Tab(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(model.name),
              ),
            );
          }).toList()
        : (controller.projectTabs).map((model) {
            return Tab(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(model.name),
              ),
            );
          }).toList();
  }

  List<Widget> _createTabsPage() {
    return widget.tagType == TagType.publicAccount
        ? (controller.wechatPublic).map((model) {
            final controller = ProjectController();
            controller.tagType = widget.tagType;
            controller.id = model.id.toString();
            Get.put(controller, tag: model.id.toString());
            return ProjectPage(id: model.id.toString());
          }).toList()
        : (controller.projectTabs).map((model) {
            final controller = ProjectController();
            controller.tagType = widget.tagType;
            controller.id = model.id.toString();
            Get.put(controller, tag: model.id.toString());
            return ProjectPage(id: model.id.toString());
          }).toList();
  }

  @override
  bool get wantKeepAlive => true;
}
