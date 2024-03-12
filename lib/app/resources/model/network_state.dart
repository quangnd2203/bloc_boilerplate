// ignore_for_file: avoid_dynamic_calls, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, deprecated_member_use

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../blocs/authentication/authentication_cubit.dart';
import '../../constants/app_endpoint.dart';
import '../../constants/app_values.dart';
import '../../routes/app_pages.dart';
import 'error_body_model.dart';

typedef NetworkStateConverter<T> = T Function(dynamic json);

class NetworkState<T> {
  NetworkState({this.message, this.data, this.status});

  NetworkState.withDisconnect() {
    message = 'system_lost_internet'.tr;
    status = AppEndpoint.ERROR_DISCONNECT;
    data = null;
    errorData = null;
  }

  NetworkState.withErrorConvert() {
    data = null;
  }

  NetworkState.withError(dio.DioError error) {
    String? message;
    int? code;
    final dio.Response<dynamic>? response = error.response;
    if (response != null) {
      code = response.statusCode;
      message = _handleMessageByStatusCode(code, error);
    } else {
      code = AppEndpoint.ERROR_SERVER;
      message = 'system_can_not_connect_server'.tr;
    }
    this.message = message;
    status = code;
    data = null;
    errorData = response?.data;
  }

  String? _handleMessageByStatusCode(int? statusCode, dio.DioError error) {
    switch (statusCode) {
      case AppEndpoint.UNAUTHORIZED:
        // if(!Get.currentRoute.contains(Routes.LOGIN)){
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLogout(false, true));
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLoading());
        // }
        // if(!AUTHORIZED_ROUTES.contains(Get.currentRoute)){
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLogout(false, true));
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLoading());
        // }
        break;
      case AppEndpoint.TOO_MANY_REQUEST:
        return 'too_many_request';

      case AppEndpoint.ERROR_DISCONNECT:
        // if(!Get.currentRoute.contains(Routes.LOGIN)){
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLogout(false, false));
        //   Get.find<AuthenticationCubit>().emit(AuthenticationStateLoading());
        // }
        return null;
    }
    return (error.response?.data['message'] as String?) ?? ErrorBody.fromJson(error.response?.data).errors!.first.message ?? '';
  }

  int? status;
  String? message;
  T? data;
  dynamic errorData;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    data['errorData'] = errorData;
    return data;
  }

  bool get isSuccess => status == AppEndpoint.SUCCESS;

  bool get isError => status != AppEndpoint.SUCCESS;
}
