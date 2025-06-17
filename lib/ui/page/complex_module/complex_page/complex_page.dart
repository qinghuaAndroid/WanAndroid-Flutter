import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/complex_module/ask_page/ask_page.dart';
import 'package:wan_android_flutter/ui/page/complex_module/main_page/main_page.dart';
import 'package:wan_android_flutter/ui/page/complex_module/square_page/square_page.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : ComplexPage
/// @date : 2021/08/23
/// @name : jhf
/// @description :综合页面 View层
class ComplexPage extends StatefulWidget {
  const ComplexPage({super.key});

  @override
  State<ComplexPage> createState() => _ComplexPageState();
}

class _ComplexPageState extends State<ComplexPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,

                  ///导航栏
                  child: TabBar(
                    isScrollable: true,
                    labelColor: ColorStyle.color_24CF5F,
                    unselectedLabelColor: ColorStyle.color_B8C0D4,
                    controller: tabController,
                    labelStyle: Styles.style_FE8C28_24_bold,
                    unselectedLabelStyle: Styles.style_FFAE2E_16,
                    tabs: [
                      Tab(text: StringStyles.tabHome.tr),
                      Tab(text: StringStyles.tabSquare.tr),
                      Tab(text: StringStyles.tabAsk.tr),
                    ],
                  ),
                ),

                ///间隔
                const Expanded(child: SizedBox()),

                ///搜索框
                Ripple(
                  circular: 20,
                  onTap: () => Get.toNamed(Routes.searchPage),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      R.assetsImagesSearch,
                      color: Colors.black87,
                      width: 30,
                    ),
                  ),
                ),

                Box.hBox20,
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [MainPage(), SquarePage(), AskPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
