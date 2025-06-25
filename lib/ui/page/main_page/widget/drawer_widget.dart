import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/page/main_page/main_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart';

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
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
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
          ListTile(
            leading: Image.asset(assetImage('ic_score'), color: Colors.black),
            title: Text(S.of(context).nav_my_score),
            onTap: () {
              Navigate.push(Routes.pointsPage);
            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_collect'), color: Colors.black),
            title: Text(S.of(context).nav_my_collect),
            onTap: () {
              Navigate.push(Routes.collectPage);
            },
          ),
          ListTile(
            leading: Image.asset(
              assetImage('ic_question'),
              color: Colors.black,
            ),
            title: Text(S.of(context).nav_question),
            onTap: () {

            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_todo'), color: Colors.black),
            title: Text(S.of(context).nav_todo),
            onTap: () {

            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_square'), color: Colors.black),
            title: Text(S.of(context).nav_square),
            onTap: () {

            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_night'), color: Colors.black),
            title: Text(S.of(context).nav_night_mode),
            onTap: () {

            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_setting'), color: Colors.black),
            title: Text(S.of(context).nav_setting),
            onTap: () {
              Navigate.push(Routes.settingPage);
            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_about'), color: Colors.black),
            title: Text(S.of(context).nav_about_us),
            onTap: () {
              Navigate.push(Routes.aboutPage);
            },
          ),
          ListTile(
            leading: Image.asset(assetImage('ic_logout'), color: Colors.black),
            title: Text(S.of(context).nav_logout),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
