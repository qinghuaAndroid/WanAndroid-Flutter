import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetCommonView<T extends GetxController> extends StatefulWidget {
  const GetCommonView({super.key});

  final String? tag = null;

  T get controller => Get.find<T>(tag: tag);

  ///Get 局部更新字段
  get updateId => null;

  @protected
  Widget build(BuildContext context);

  @override
  AutoDisposeState createState() => AutoDisposeState<T>();
}

/// @class : AutoDisposeState
/// @name : jhf
/// @description :基类,可自动装载的状态管理
class AutoDisposeState<S extends GetxController> extends State<GetCommonView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: widget.updateId,
      builder: (controller) {
        return widget.build(context);
      },
    );
  }

  @override
  void dispose() {
    Get.delete<S>();
    super.dispose();
  }
}
