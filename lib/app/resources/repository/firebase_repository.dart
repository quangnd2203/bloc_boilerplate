// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import '../../constants/constants.dart';
// // import '../../utils/app_clients.dart';
// // import '../model/model.dart';
// // import '../service/wifi_service.dart';
// // import 'package:dio/dio.dart';
//
//
// class FirebaseRepository {
//
//   factory FirebaseRepository() {
//     _instance ??= FirebaseRepository._();
//     return _instance!;
//   }
//   FirebaseRepository._();
//
//   static FirebaseRepository? _instance;
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> verifyPhoneNumber(
//       String phoneNumber,
//       PhoneVerificationCompleted verificationCompleted,
//       PhoneVerificationFailed verificationFailed,
//       PhoneCodeSent codeSent,
//       PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout) async {
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: const Duration(seconds: 120),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }
//
//   Future<UserCredential> signInWithCredential(AuthCredential authCredential) =>
//       _auth.signInWithCredential(authCredential);
//
//   Future<User?> getUser(UserCredential authResult) async {
//     final User? user = authResult.user;
//     final User? currentUser = _auth.currentUser;
//     if (user != null && currentUser != null && user.uid == currentUser.uid) {
//       return user;
//     }
//     return null;
//   }
//
//   Future<void> signOut() => _auth.signOut();
//
// // Future<NetworkState> updateFirebaseToken() async {
// //   bool isDisconnect = await WifiService.isDisconnect();
// //   if (isDisconnect) return NetworkState.withDisconnect();
// //   try {
// //     String? token = await FirebaseMessaging.instance.getToken();
// //     Response response = await AppClients().post("URL", data: {"fcm_device_token": token});
// //     return NetworkState(
// //       status: response.statusCode ?? AppEndpoint.SUCCESS,
// //       data: response.data,
// //     );
// //   } on DioError catch (e) {
// //     return NetworkState.withError(e);
// //   }
// // }
// }
