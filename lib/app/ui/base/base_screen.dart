// ignore_for_file: flutter_style_todos

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../ui.dart';
import '../widgets/widgets.dart';

class BaseScreen<T extends BaseController> extends GetResponsiveView<T>{
  BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<T>(
      dispose: dispose,
      initState: initState,
      builder: (BaseController controller) {
        return LoadingFullScreen(
          loading: controller.loading.value,
          child: builder()!,
        );
      },
    );
  }

  void dispose(GetXState<T> state){
    Logger().d('DISPOSE: "$runtimeType" - "$T"');
    Get.delete<T>();
  }

  void initState(GetXState<T> state){

  }

  @override
  Widget? builder() {
    // TODO: implement builder
    switch(screen.screenType){
      case ScreenType.Phone: return phone();
      case ScreenType.Desktop: return desktop();
      case ScreenType.Tablet: return tablet();
      case ScreenType.Watch: return watch();
    }
  }

  @override
  Widget desktop() {
    return const SizedBox();
  }

  @override
  Widget phone() {
    return const SizedBox();
  }

  @override
  Widget tablet() {
    return const SizedBox();
  }

  @override
  Widget watch() {
    return const SizedBox();
  }

}
