// ignore_for_file: avoid_dynamic_calls, deprecated_member_use

import 'package:dio/dio.dart';

import '../../constants/app_endpoint.dart';
import '../../utils/app_clients.dart';
import '../resources.dart';

class AuthRepository {
  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }

  AuthRepository._();

  static AuthRepository? _instance;

  // Future<NetworkState<String>> login(String diaCode, String phoneNumber, String password) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<String>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.LOGIN,
  //       data: <String, dynamic>{
  //         'dial_country_code': diaCode,
  //         'phone': phoneNumber,
  //         'password': password,
  //       },
  //     );
  //     return NetworkState<String>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data?['content'] as String?,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<String>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<String>> checkPhone(String phoneNumber) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<String>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.CHECK_PHONE,
  //       data: <String, dynamic>{
  //         'phone': phoneNumber,
  //       },
  //     );
  //     return NetworkState<String>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data?['otp'] as String?,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<String>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> reSendOtp(String phoneNumber) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.RESEND_OTP,
  //       data: <String, dynamic>{
  //         'phone': phoneNumber,
  //       },
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> verifyPhoneNumberOtp(String phoneNumber, String otp) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.VERIFY_PHONE_NUMBER_OTP,
  //       data: <String, dynamic>{'phone': phoneNumber, 'otp': otp},
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> register(Map<String, dynamic> data) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.REGISTER,
  //       data: data,
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> sendOtpForgotPassword(String phoneNumber) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.SEND_OTP_FORGOT_PASSWORD,
  //       data: <String, dynamic>{
  //         'phone': phoneNumber,
  //       },
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> verifyOtpForgotPassword(String phoneNumber, String otp) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.VERIFY_OTP_FORGOT_PASSWORD,
  //       data: <String, dynamic>{'phone': phoneNumber, 'otp': otp},
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> resetPassword(Map<String, dynamic> data) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.put(
  //       AppEndpoint.RESET_PASSWORD,
  //       data: data,
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> changePassword(Map<String, dynamic> data) async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(
  //       AppEndpoint.CHANGE_PASSWORD,
  //       data: data,
  //     );
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //       message: response.data['message'] as String?,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> logout() async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.post(AppEndpoint.LOGOUT);
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
  //
  // Future<NetworkState<dynamic>> delete() async {
  //   final bool isDisconnect = await WifiService.isDisconnect();
  //   if (isDisconnect) {
  //     return NetworkState<dynamic>.withDisconnect();
  //   }
  //   try {
  //     final Response<dynamic> response = await AppClients.localServerInstance.delete(AppEndpoint.DELETE_ACCOUNT);
  //     return NetworkState<dynamic>(
  //       status: AppEndpoint.SUCCESS,
  //       data: response.data,
  //     );
  //   } on DioError catch (e) {
  //     return NetworkState<dynamic>.withError(e);
  //   }
  // }
}
