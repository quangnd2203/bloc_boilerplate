import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_app/shared/constants/application_loading.dart';
import 'package:flutter_app/domain/interface/service/i_crashlytics_service.dart';
import 'package:flutter_app/domain/interface/service/i_wifi_service.dart';
import 'package:flutter_app/presentation/feature/widgets/dialog/app_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/application/usecase/notification/notification_initialize_usecase.dart';

part 'application_state.dart';
part 'application_action_helper.dart';

class ApplicationCubit extends Cubit<ApplicationState>{
  ApplicationCubit() : super(const ApplicationState()){
    Get.find<IWifiService>().onListener(onWifiStatus);
    Get.find<ICrashlyticsService>().onApplicationCrash();
    _notificationInitializeUseCase.execute();
  }

  final NotificationInitializeUseCase _notificationInitializeUseCase = Get.find<NotificationInitializeUseCase>();

  final _ApplicationActionHelper helper = _ApplicationActionHelper();

  void setLoading([bool loading = true]) {
    if (loading) {
      emit(state.copyWith(loading: ApplicationLoading.loading));
    } else {
      emit(state.copyWith(loading: ApplicationLoading.completed));
    }
  }

  void onWifiStatus(ConnectivityResult result) {
    emit(state.copyWith(connectivityResult: result));
  }

  Future<T?> showBottomSheet<T>(BuildContext context, WidgetBuilder builder, {bool isDismissible = true}) {
    return helper.showBottomSheet(context, builder, isDismissible: isDismissible);
  }

  Future<bool> showConfirmDialog({String title = 'alert', String? des, IconData? icon, String? keyCancel, String? keyConfirm}) async {
    final bool? result = await helper.confirm(title: title, des: des, icon: icon, keyCancel: keyCancel, keyConfirm: keyConfirm);
    return result ?? false;
  }

  Future<void> showNotificationDialog({String title = 'notification', String? des, IconData? icon}) {
    return helper.notification(title: title, des:  des, icon: icon);
  }

  void showSnackBar(String message, {bool isError = false, bool isIcon = false}) {
    return helper.showSnackbar(message, isError: isError, isIcon: isIcon);
  }

  void unFocus() {
    return helper.unFocus();
  }

  void focus(BuildContext context, FocusNode node) {
    return helper.focus(context, node);
  }

}
