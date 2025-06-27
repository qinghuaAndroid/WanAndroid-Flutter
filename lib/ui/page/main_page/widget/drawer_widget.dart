import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/main_page/main_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart' hide ScreenUtil;

class DrawerWidget extends StatelessWidget {
  final MainController controller;

  const DrawerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(color: Colors.transparent),
            ),
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Provider.of<ThemeColorsNotifier>(context).color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    margin: EdgeInsetsDirectional.only(bottom: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.w)),
                      border: Border.all(color: Colors.white, width: 2.w),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        assetImage('ic_default_avatar'),
                        width: 80.w,
                        height: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    controller.userInfo.nickname,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          XListTile(
            leading: assetImage('ic_score'),
            title: S.of(context).nav_my_score,
            onTap: () {
              Navigate.push(Routes.pointsPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_collect'),
            title: S.of(context).nav_my_collect,
            onTap: () {
              Navigate.push(Routes.collectPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_question'),
            title: S.of(context).nav_question,
            onTap: () {},
          ),
          XListTile(
            leading: assetImage('ic_square'),
            title: S.of(context).nav_square,
            onTap: () {},
          ),
          XListTile(
            leading: assetImage('ic_setting'),
            title: S.of(context).nav_setting,
            onTap: () {
              Navigate.push(Routes.settingPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_about'),
            title: S.of(context).nav_about_us,
            onTap: () {
              Navigate.push(Routes.aboutPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_logout'),
            title: S.of(context).nav_logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class XListTile extends StatelessWidget {
  final String leading;
  final String title;
  final GestureTapCallback? onTap;

  const XListTile({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        leading,
        color: Colors.black,
        width: 24.w,
        height: 24.w,
      ),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      onTap: onTap,
    );
  }
}
