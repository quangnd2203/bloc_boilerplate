import 'package:connectivity_plus/connectivity_plus.dart';
<<<<<<< HEAD
import 'package:equatable/equatable.dart';
=======
>>>>>>> migration
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
<<<<<<< HEAD

import '../../../core/constants/application_loading.dart';
import '../../../interface/bloc/application/application_cubit.dart';
import '../../../interface/service/crashlytics.dart';
import '../../../interface/service/wifi.dart';
import '../../../interface/usecase/notification.dart';
import '../../feature/widgets/dialog/app_dialog.dart';
=======
import 'package:flutter_app/shared/constants/application_loading.dart';
import 'package:flutter_app/domain/interface/service/crashlytics.dart';
import 'package:flutter_app/domain/interface/service/wifi.dart';
import 'package:flutter_app/presentation/feature/widgets/dialog/app_dialog.dart';
import 'package:flutter_app/application/usecase/notification.dart';
import 'package:equatable/equatable.dart';
>>>>>>> migration

part 'application_state.dart';
part 'application_action_helper.dart';

<<<<<<< HEAD
class ApplicationCubit extends Cubit<IApplicationState> implements IApplicationCubit{
  ApplicationCubit() : super(const ApplicationState()){
    Get.find<IWifiService>().onListener(onWifiStatus);
    Get.find<ICrashlyticsService>().onApplicationCrash();
    Get.find<INotificationUseCase>()..initialize()..onMessageOpenedApp(_onMessageOpenedApp);
=======
class ApplicationCubit extends Cubit<ApplicationState>{
  ApplicationCubit() : super(const ApplicationState()){
    Get.find<IWifiService>().onListener(onWifiStatus);
    Get.find<ICrashlyticsService>().onApplicationCrash();
    Get.find<NotificationUseCase>()..initialize()..onMessageOpenedApp(_onMessageOpenedApp);
>>>>>>> migration
  }

  final _ApplicationActionHelper helper = _ApplicationActionHelper();


  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    // Push another page onto the navigator when received a message
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  void setLoading([bool loading = true]) {
    if (loading) {
      emit(state.copyWith(loading: ApplicationLoading.loading));
    } else {
      emit(state.copyWith(loading: ApplicationLoading.completed));
    }
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  void onWifiStatus(ConnectivityResult result) {
    emit(state.copyWith(connectivityResult: result));
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  Future<T?> showBottomSheet<T>(BuildContext context, WidgetBuilder builder, {bool isDismissible = true}) {
    return helper.showBottomSheet(context, builder, isDismissible: isDismissible);
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  Future<bool> showConfirmDialog({String title = 'alert', String? des, IconData? icon, String? keyCancel, String? keyConfirm}) async {
    final bool? result = await helper.confirm(title: title, des: des, icon: icon, keyCancel: keyCancel, keyConfirm: keyConfirm);
    return result ?? false;
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  Future<void> showNotificationDialog({String title = 'notification', String? des, IconData? icon}) {
    return helper.notification(title: title, des:  des, icon: icon);
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  void showSnackBar(String message, {bool isError = false, bool isIcon = false}) {
    return helper.showSnackbar(message, isError: isError, isIcon: isIcon);
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  void unFocus() {
    return helper.unFocus();
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  void focus(BuildContext context, FocusNode node) {
    return helper.focus(context, node);
  }

}
