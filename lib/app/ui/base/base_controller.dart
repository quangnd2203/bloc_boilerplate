// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../ui.dart';

class BaseController extends GetxController {
  BuildContext context = Get.context!;

  RxBool loading = false.obs;

  void setLoading(bool status) {
    if (status)
      loading.value = true;
    else
      loading.value = false;
  }

  Future<bool?> confirm(String title, {String keyConfirm = 'OK', String keyCancel = 'reset_password_button_cancel'}) async {
    return Get.dialog(DialogConfirm(
      title: title,
      keyConfirm: keyConfirm,
      keyCancel: keyCancel,
    ));
  }

  Future<bool?> notification(String title, {String keyConfirm = 'reset_password_button_back'}) async {
    return Get.dialog(DialogNotification(
      title: title,
      keyConfirm: keyConfirm,
    ));
  }

  void unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  }

  Future<bool> checkPermission(Permission permission) async {
    return permission.isGranted;
  }

  // dynamic checkRole(VoidCallback next, [List<AppRole> requiredRole = AppRole.values]) {
  //   final bool isNext = requiredRole.contains(AppPrefs.userRole);
  //   if (isNext)
  //     next();
  //   else
  //     notification('no_permission');
  //   // if (anotherCondition != null) {
  //   //   final bool isAnother = anotherCondition(AppPrefs.userRole!);
  //   //   if (isNext || isAnother)
  //   //     next();
  //   //   else
  //   //     notification('no_permission');
  //   // } else {
  //   //   if (isNext)
  //   //     next();
  //   //   else
  //   //     notification('no_permission');
  //   // }
  // }
}
