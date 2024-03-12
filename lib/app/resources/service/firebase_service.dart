// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
// import '../../blocs/authentication/authentication_cubit.dart';
// import '../../constants/constants.dart';
// import '../../notification/notification.dart';
// import '../../routes/app_pages.dart';
//
// class FirebaseService {
//   factory FirebaseService() {
//     _instance ??= FirebaseService._();
//
//     return _instance!;
//   }
//   FirebaseService._();
//
//   static FirebaseService? _instance;
//   late final FirebaseDynamicLinks firebaseDynamicLinks;
//
//   Future<void> init() async {
//     await Firebase.initializeApp();
//     notificationInitialed();
//     if(!kDebugMode){
//       onApplicationCrash();
//     }
//     firebaseDynamicLinks = FirebaseDynamicLinks.instance;
//     final PendingDynamicLinkData? initialLink = await firebaseDynamicLinks.getInitialLink();
//     onPressDeepLink(initialLink);
//     FirebaseDynamicLinks.instance.onLink.listen(onPressDeepLink);
//   }
//
//   void onApplicationCrash() {
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//     PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//   }
//
//   void onPressDeepLink(PendingDynamicLinkData? pendingDynamicLinkData) {
//     if (pendingDynamicLinkData != null) {
//       final Uri deepLink = pendingDynamicLinkData.link;
//       switch (deepLink.path) {
//         case DYNAMIC_LINK_REQUEST_INVITE:
//           if (Get.find<AuthenticationCubit>().state is AuthenticationStateLogged) {
//             // Get.find<SplashController>().refId = deepLink.queryParameters['user_id'];
//             if (Get.currentRoute.isNotEmpty) {
//               Get.offAllNamed(Routes.SPLASH);
//             }
//           }
//           break;
//       }
//     }
//   }
//
//   Future<Uri> buildLink(String request, {String? query}) async {
//     final ShortDynamicLink shortDynamicLink = await firebaseDynamicLinks.buildShortLink(
//       DynamicLinkParameters(
//         uriPrefix: DYNAMIC_LINK_HOST,
//         link: Uri.parse('$DYNAMIC_LINK_HOST$request?$query'),
//         androidParameters: AndroidParameters(
//           packageName: 'com.vivi.wallet_user',
//           minimumVersion: 1,
//           fallbackUrl: Uri.parse('https://play.google.com/store/apps/details?id=com.vivi.wallet_user'),
//         ),
//         iosParameters: const IOSParameters(
//           bundleId: 'com.vivi.users',
//           minimumVersion: '0.0.0',
//           appStoreId: '6448404541'
//         ),
//       ),
//     );
//     return shortDynamicLink.shortUrl;
//   }
// }
