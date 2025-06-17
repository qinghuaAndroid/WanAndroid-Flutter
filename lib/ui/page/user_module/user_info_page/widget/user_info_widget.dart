import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/res/res.dart';

/// @class : UserInfoWidget
/// @date : 2021/08/25
/// @name : jhf
/// @description :用户信息公共栏
class UserInfoWidget extends StatelessWidget {
  final String keys;
  final String value;

  const UserInfoWidget({super.key, this.keys = "", this.value = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(keys, style: Styles.style_black_15),
          Text(value, style: Styles.style_black_15),
        ],
      ),
    );
  }
}
