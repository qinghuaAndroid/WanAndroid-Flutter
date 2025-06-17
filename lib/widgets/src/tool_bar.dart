import 'package:flutter/material.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @page : ToolBar
/// @name : jhf
/// @description :公共标题栏
class ToolBar extends StatefulWidget {
  ///标题文字
  final String title;

  ///右侧文字
  final String endText;

  ///是否显示右侧
  final bool isShowEnd;

  ///背景颜色
  final Color backgroundColor;

  ///背景颜色
  final Color backColor;

  final VoidCallback? backOnTap;

  const ToolBar({
    super.key,
    this.title = "",
    this.endText = "",
    this.isShowEnd = false,
    this.backgroundColor = Colors.white,
    this.backOnTap,
    this.backColor = ColorStyle.color_B8C0D4,
  });

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: SafeArea(
        top: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 6, left: 15),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onTap: widget.backOnTap ?? () => Navigate.pop(),
                splashColor: ColorStyle.color_E2E3E8_66,
                highlightColor: ColorStyle.color_E2E3E8_66,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Icon(Icons.arrow_back, color: widget.backColor),
                ),
              ),
            ),

            Container(
              width: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5, right: 12),
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.endText,
                style: const TextStyle(
                  color: ColorStyle.color_B8C0D4,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
