import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @class : GetCommonView
/// @name : jhf
/// @description :基类,用于绑定Controller
abstract class GetCommonView<T extends GetxController> extends StatefulWidget {
  const GetCommonView({super.key});

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  ///Get 局部更新字段
  get updateId => null;

  @protected
  Widget build(BuildContext context);

  @override
  GetCommonViewState<T> createState() => GetCommonViewState<T>();
}

/// @class : AutoDisposeState
/// @name : jhf
/// @description :基类,可自动装载的状态管理
class GetCommonViewState<S extends GetxController>
    extends State<GetCommonView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<S>(
      id: widget.updateId,
      tag: widget.tag,
      builder: (controller) {
        return widget.build(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<S>(tag: widget.tag);
    super.dispose();
  }
}
