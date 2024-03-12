// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'local_notification.dart';
// import 'notification.dart';
// import 'notification_data.dart';
//
// //This method will be call in background where have a new message
// Future<void> backgroundMessageHandler(RemoteMessage message) async {
//   //Do not thing...
//   log('OnBackgroundMessage: $message');
//   return FirebaseCloudMessaging._handler(message);
// }
//
// class FirebaseCloudMessaging {
//   FirebaseCloudMessaging._();
//
//   static final FirebaseMessaging instance = FirebaseMessaging.instance;
//
//   static Future<String?> getFCMToken() async{
//     final String? resultFCMToken = await FirebaseMessaging.instance.getToken();
//     return resultFCMToken;
//   }
//
//   static Future<void> initFirebaseMessaging() async {
//     await instance.requestPermission();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('onMessage: ${message.data}');
//       _handler(message, show: true);
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       log('onMessageOpenApp: ${message.data}');
//       _handler(message,show: true);
//     });
//     FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
//     final RemoteMessage? initMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initMessage != null) {
//       _handler(initMessage);
//     }
//   }
//
//   static void _handler(RemoteMessage message, {bool show = false}) {
//     final Data payload = Data.fromJson(message.data);
//     if (show) {
//       LocalNotification.showNotification(message.notification?.title,
//           message.notification?.body, payload.toString());
//       notificationSubject.add(true);
//     } else {
//       selectNotificationSubject.add(payload.toString());
//     }
//   }
//
//   static void subscribeToTopic(String topic){
//     FirebaseMessaging.instance.subscribeToTopic(topic);
//   }
//
//   static void unSubscribeToTopic(String topic){
//     FirebaseMessaging.instance.unsubscribeFromTopic(topic);
//   }
// }
