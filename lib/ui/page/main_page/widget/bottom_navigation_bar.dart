import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class MBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ParamSingleCallback<int> onTap;

  const MBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeColorsNotifier>(
      builder:
          (BuildContext context, ThemeColorsNotifier notifier, Widget? child) {
            return BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: notifier.color,
              unselectedItemColor: ColorStyle.color_B8C0D4,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    assetImage("home"),
                    width: 24.w,
                    height: 24.w,
                    color: currentIndex == 0
                        ? notifier.color
                        : ColorStyle.color_B8C0D4,
                  ),
                  label: S.of(context).tab_1,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    assetImage("system"),
                    width: 24.w,
                    height: 24.w,
                    color: currentIndex == 1
                        ? notifier.color
                        : ColorStyle.color_B8C0D4,
                  ),
                  label: S.of(context).tab_2,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    assetImage("official_account"),
                    width: 24.w,
                    height: 24.w,
                    color: currentIndex == 2
                        ? notifier.color
                        : ColorStyle.color_B8C0D4,
                  ),
                  label: S.of(context).tab_3,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    assetImage("navigation"),
                    width: 24.w,
                    height: 24.w,
                    color: currentIndex == 3
                        ? notifier.color
                        : ColorStyle.color_B8C0D4,
                  ),
                  label: S.of(context).tab_4,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    assetImage("project"),
                    width: 24.w,
                    height: 24.w,
                    color: currentIndex == 4
                        ? notifier.color
                        : ColorStyle.color_B8C0D4,
                  ),
                  label: S.of(context).tab_5,
                ),
              ],
              onTap: (index) {
                onTap.call(index);
              },
            );
          },
    );
  }
}
