import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../ui/ui.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.completed);

  void setLoading([bool isLoading = true]) {
    if (isLoading) {
      emit(ApplicationState.loading);
    } else {
      emit(ApplicationState.completed);
    }
  }

  Future<bool?> confirm(String title, {String keyConfirm = 'OK', String keyCancel = 'reset_password_button_cancel'}) async {
    final bool? _ = await Get.dialog(DialogConfirm(
      title: title,
      keyConfirm: keyConfirm,
      keyCancel: keyCancel,
    ));
    return _ ?? false;
  }

  Future<void> notification(String title, {String keyConfirm = 'reset_password_button_back'}) async {
    return Get.dialog(DialogNotification(
      title: title,
      keyConfirm: keyConfirm,
    ));
  }

  void unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  }
}
