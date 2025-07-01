import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @page : ToolBar
/// @name : jhf
/// @description :公共标题栏
class ToolBar extends StatefulWidget {
  ///标题文字
  final String title;

  ///背景颜色
  final Color? backgroundColor;

  ///返回键颜色
  final Color? backColor;

  ///标题颜色
  final Color? titleColor;

  final VoidCallback? backOnTap;

  final SystemUiOverlayStyle? systemOverlayStyle;

  const ToolBar({
    super.key,
    this.title = "",
    this.backgroundColor,
    this.backOnTap,
    this.backColor,
    this.titleColor,
    this.systemOverlayStyle,
  });

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          widget.backgroundColor ??
          Provider.of<ThemeColorsNotifier>(context).color,
      leading: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: widget.backOnTap ?? () => Navigate.pop(),
        child: Icon(Icons.arrow_back, color: widget.backColor ?? Colors.white),
      ),
      title: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200.w),
        child: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: widget.titleColor ?? Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
      systemOverlayStyle: widget.systemOverlayStyle,
    );
  }
}
