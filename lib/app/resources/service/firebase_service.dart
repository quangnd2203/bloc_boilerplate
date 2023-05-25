// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
// import '../../routes/app_pages.dart';
// import '../../ui/dashboard/dashboard_controller.dart';
// import '../../utils/app_utils.dart';
//
// class FirebaseService {
//   factory FirebaseService() {
//     _instance ??= FirebaseService._();
//
//     return _instance!;
//   }
//   FirebaseService._();
//   static FirebaseService? _instance;
//
//   Future<void> init() async {
//     await Firebase.initializeApp();
//     onApplicationCrash();
//     final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
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
//         case '/sign-in':
//           AppUtils.logout(false);
//           if (Get.isRegistered<DashBoardController>())
//             Get.find<DashBoardController>().onLogout();
//           else if (Get.currentRoute.isNotEmpty && Get.currentRoute != Routes.LOGIN && Get.currentRoute != Routes.SPLASH) {
//             AppUtils.logout();
//           }
//       }
//     }
//   }
// }
