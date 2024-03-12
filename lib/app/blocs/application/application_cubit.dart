import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../resources/model/model.dart';
import '../../ui/widgets/dialog/app_dialog.dart';
import '../../utils/app_pref.dart';

part 'application_state.dart';
part 'application_action_helper.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(const ApplicationState());


  final _ApplicationActionHelper _helper = _ApplicationActionHelper();

  Future<bool?> Function({String title, String? des, IconData? icon, String? keyCancel, String? keyConfirm}) get confirm => _helper.confirm;

  Future<void> Function({String title, String? des, IconData? icon}) get notification => _helper.notification;

  Future<T?> Function<T>(BuildContext context, WidgetBuilder builder, {bool isDismissible}) get showBottomSheet => _helper.showBottomSheet;

  void Function(String message, {bool isError, bool isIcon}) get showSnackbar => _helper.showSnackbar;

  void Function() get unFocus => _helper.unFocus;

  void Function(BuildContext context, FocusNode node) get focus => _helper.focus;

  void setLoading([bool isLoading = true]) {
    if (isLoading) {
      emit(state.copyWith(loading: ApplicationLoading.loading));
    } else {
      emit(state.copyWith(loading: ApplicationLoading.completed));
    }
  }

  // Future<void> loadConfig() async {
  //   final NetworkState<ConfigModel> networkState = await configRepository.getConfig();
  //   if(networkState.isSuccess){
  //     emit(state.copyWith(config: networkState.data));
  //     AppPrefs.config = networkState.data;
  //   }
  // }
  //
  // Future<void> loadStateConfig() async {
  //   setLoading();
  //   final NetworkState<List<StateModel>> networkState = await configRepository.getStates();
  //   setLoading(false);
  //   emit(state.copyWith(states: networkState.data));
  // }

}
