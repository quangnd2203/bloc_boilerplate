// // ignore_for_file: always_specify_types, avoid_function_literals_in_foreach_calls
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
//
// import '../../constants/app_values.dart';
// import '../../notification/firebase_messaging.dart';
// import '../../resources/model/model.dart';
// import '../../resources/repository/auth_repository.dart';
// import '../../resources/repository/profile_repository.dart';
// import '../../routes/app_pages.dart';
// import '../../ui/merchant/bloc/merchant_list_cubit.dart';
// import '../../utils/app_pref.dart';
// import '../../utils/app_utils.dart';
// import '../application/application_cubit.dart';
// import '../profile/profile_cubit.dart';
// part 'authentication_state.dart';
//
// class AuthenticationCubit extends Cubit<AuthenticationState> {
//   AuthenticationCubit() : super(AuthenticationStateLoading());
//
//   final AuthRepository authRepository = AuthRepository();
//   final ProfileRepository profileRepository = ProfileRepository();
//   final ApplicationCubit applicationCubit = Get.find<ApplicationCubit>();
//   final ProfileCubit profileCubit = Get.find<ProfileCubit>();
//
//   void saveData(AuthenticationStateLogged state) {
//     AppPrefs.phoneNumber = state.phoneNumber;
//     AppPrefs.accessToken = state.accessToken;
//     AppPrefs.dialCountryCode = state.dialCountryCode;
//     updateFcmToken();
//     Get.offAllNamed(Routes.DASHBOARD);
//   }
//
//   Future<void> clearData(AuthenticationStateLogout state) async {
//     if (state.isUnauthorized)
//       await applicationCubit.notification(
//         des: 'login_again',
//       );
//     AppPrefs.accessToken = null;
//     if (state.isCleanData) {
//       Get.offAllNamed(Routes.SPLASH);
//       AppPrefs.phoneNumber = null;
//       AppPrefs.dialCountryCode = null;
//       profileCubit.deleteUserData();
//       FirebaseCloudMessaging.unSubscribeToTopic(NOTIFICATION_ALL);
//       FirebaseCloudMessaging.unSubscribeToTopic(NOTIFICATION_USERS);
//       Get.find<MerchantListCubit>().state.merchantList.forEach((element) {
//         FirebaseCloudMessaging.unSubscribeToTopic('${element.id}-$NOTIFICATION_MERCHANT_USERS');
//       });
//     } else {
//       Get.offAllNamed(Routes.LOGIN);
//     }
//   }
//
//   Future<void> login({
//     required String dialCode,
//     required String code,
//     required String phoneNumber,
//     required String password,
//   }) async {
//     applicationCubit.setLoading();
//     final NetworkState<String> loginState = await authRepository.login(dialCode, phoneNumber, password);
//     AppPrefs.accessToken = loginState.data;
//     final bool isGetProfileSuccess = await profileCubit.getProfile();
//     applicationCubit.setLoading(false);
//     final bool isSuccess = loginState.isSuccess && isGetProfileSuccess;
//     applicationCubit.showSnackbar(isSuccess ? 'successfully_login' : 'login_invalid', isError: !isSuccess);
//     if (isSuccess) {
//       emit(AuthenticationStateLogged(
//         dialCountryCode: code,
//         phoneNumber: phoneNumber,
//         accessToken: loginState.data!,
//       ));
//     } else {
//       emit(AuthenticationStateLoading());
//     }
//   }
//
//   Future<(bool, String)> checkPhone(String countryCode, String dialCode, String phoneNumber) async {
//     final String phoneNumber0 = dialCode + phoneNumber;
//     AppPrefs.dialCountryCode = countryCode;
//     applicationCubit.setLoading();
//     final NetworkState<String> networkState = await authRepository.checkPhone(phoneNumber0);
//     applicationCubit.setLoading(false);
//     if (networkState.isError) {
//       if (networkState.status == 403) {
//         Get.offAllNamed(Routes.LOGIN, arguments: phoneNumber);
//       } else {
//         applicationCubit.showSnackbar(networkState.message!, isError: true);
//       }
//     }
//     return (networkState.isSuccess, phoneNumber0);
//   }
//
//   Future<bool> register(Map<String, String> data) async {
//     final NetworkState<dynamic> networkState = await authRepository.register(data);
//     if (networkState.isSuccess) {
//       login(
//         dialCode: data['dial_country_code']!,
//         code: AppPrefs.dialCountryCode!,
//         phoneNumber: data['phone']!.replaceAll(data['dial_country_code']!, ''),
//         password: data['password']!,
//       );
//     }
//     applicationCubit.showSnackbar(networkState.isSuccess ? 'register_success' : networkState.message!, isError: networkState.isError);
//     return networkState.isSuccess;
//   }
//
//   Future<(bool, String)> sendOtpForgotPassword(String countryCode, String dialCode, String phoneNumber) async {
//     final String phoneNumber0 = dialCode + phoneNumber;
//     AppPrefs.dialCountryCode = countryCode;
//     applicationCubit.setLoading();
//     final NetworkState<dynamic> networkState = await authRepository.sendOtpForgotPassword(phoneNumber0);
//     applicationCubit.setLoading(false);
//     if (networkState.isError) {
//       applicationCubit.showSnackbar(networkState.message ?? 'send_otp_forgot_fail', isError: true);
//     }
//     return (networkState.isSuccess, phoneNumber0);
//   }
//
//   Future<void> resetPassword(Map<String, dynamic> data) async {
//     applicationCubit.setLoading();
//     final NetworkState<dynamic> networkState = await authRepository.resetPassword(data);
//     applicationCubit.setLoading(false);
//     if (networkState.isSuccess) {
//       final String phone = data['phone'] as String;
//       AppPrefs.phoneNumber = phone.replaceAll(AppUtils.getDialCodeByCountryCode(AppPrefs.dialCountryCode!), '');
//       Get.offAllNamed(Routes.LOGIN);
//     } else {
//       applicationCubit.showSnackbar('something_error_in_your_phone_number', isError: true);
//     }
//   }
//
//   Future<void> logout(bool isCleanData) async {
//     applicationCubit.setLoading();
//     if(isCleanData){
//       await profileRepository.updateFcmToken(null);
//     }
//     await authRepository.logout();
//     applicationCubit.setLoading(false);
//     emit(AuthenticationStateLogout(isCleanData, false));
//   }
//
//   Future<void> deleteAccount() async {
//     applicationCubit.setLoading();
//     await authRepository.delete();
//     applicationCubit.setLoading(false);
//     emit(AuthenticationStateLogout(true, false));
//   }
//
//   Future<void> updateFcmToken() async  {
//     final String? fcmToken = await FirebaseCloudMessaging.getFCMToken();
//     if(fcmToken != null){
//       profileRepository.updateFcmToken(fcmToken);
//       FirebaseCloudMessaging.subscribeToTopic(NOTIFICATION_ALL);
//       FirebaseCloudMessaging.subscribeToTopic(NOTIFICATION_USERS);
//       updateTopicNotifications();
//     }
//   }
//
//   void updateTopicNotifications(){
//     (AppPrefs.userInfo!.listMerchants!).forEach((element) {
//       if(element.followStatus == 1){
//         FirebaseCloudMessaging.subscribeToTopic('${element.merchantId}-$NOTIFICATION_MERCHANT_USERS');
//       }else{
//         FirebaseCloudMessaging.unSubscribeToTopic('${element.merchantId}-$NOTIFICATION_MERCHANT_USERS');
//       }
//     });
//   }
//
//   void onEvent(AuthenticationState state) {
//     switch (state.runtimeType) {
//       case AuthenticationStateLoading:
//         break;
//       case AuthenticationStateLogged:
//         final AuthenticationStateLogged state0 = state as AuthenticationStateLogged;
//         saveData(state0);
//         break;
//       case AuthenticationStateLogout:
//         final AuthenticationStateLogout state0 = state as AuthenticationStateLogout;
//         clearData(state0);
//         break;
//     }
//   }
// }
