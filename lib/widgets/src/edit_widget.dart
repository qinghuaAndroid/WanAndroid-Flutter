import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : EditWidget
/// @date : 2021/08/17
/// @name : jhf
/// @description :输入框样式，左边图标，右边输入框
class EditWidget extends StatefulWidget {
  ///输入框文字改变
  final ValueChanged<String>? onChanged;

  ///提示文字
  final String hintText;

  ///图标Widget
  final bool passwordType;

  const EditWidget({
    super.key,
    this.onChanged,
    this.hintText = "",
    this.passwordType = false,
  });

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  bool showPassWord = false;
  bool eyeExpand = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 50.w),
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            autofocus: false,
            maxLines: 1,
            obscureText: eyeExpand && widget.passwordType,
            style: Styles.style_black_14,
            onChanged: (text) {
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
              setState(() {
                showPassWord = text.isNotEmpty;
              });
            },
            inputFormatters: [
              ///输入长度和格式限制
              CustomizedLengthTextInputFormatter(18),
              CustomizedTextInputFormatter(
                filterPattern: RegExp("[a-zA-Z]|[0-9]|@|."),
              ),
            ],
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              hintText: widget.hintText,
              hintStyle: Styles.style_9F9EA6_14,
              border: _getEditBorder(false),
              focusedBorder: _getEditBorder(true),
              disabledBorder: _getEditBorder(false),
              enabledBorder: _getEditBorder(false),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        widget.passwordType
            ? PositionedDirectional(
                end: 50.w,
                child: IconButton(
                  icon: Image.asset(
                    eyeExpand
                        ? assetImage('password_show')
                        : assetImage('password_hide'),
                    width: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      eyeExpand = !eyeExpand;
                    });
                  },
                ),
              )
            : PositionedDirectional(
                end: 50.w,
                child: IconButton(
                  icon: Image.asset(assetImage('ic_clear'), width: 24),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
      ],
    );
  }

  ///获取输入框的Border属性，可公用
  ///[isEdit]是否获取焦点
  UnderlineInputBorder _getEditBorder(bool isEdit) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: isEdit
            ? Provider.of<ThemeColorsNotifier>(context).color
            : ColorStyle.color_EFF1F8,
        width: 0.5.w,
      ),
    );
  }
}
