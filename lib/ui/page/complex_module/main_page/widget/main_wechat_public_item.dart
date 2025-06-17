import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : WechatPublicItem
/// @date : 2021/09/08
/// @name : jhf
/// @description :首页 微信公众号Item
class WechatPublicItem extends StatelessWidget {
  final WechatPublic item;

  const WechatPublicItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: ShadowStyle.white12Circle(radius: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: ShadowStyle.black12Circle40(),
            child: R.wechatPublic.containsKey(item.id)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: Colors.white,
                      child: Image.asset(R.wechatPublic[item.id] ?? ""),
                    ),
                  )
                : HeadCircleWidget(width: 64, height: 64),
          ),
          Box.vBox15,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(R.assetsImagesWechat, width: 20),
              Box.hBox3,
              Text(item.name, style: Styles.style_black_14),
            ],
          ),
        ],
      ),
    );
  }
}
