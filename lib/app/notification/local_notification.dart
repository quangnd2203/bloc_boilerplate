// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'notification.dart';
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// NotificationAppLaunchDetails? notificationAppLaunchDetails;
//
// class LocalNotification {
//   LocalNotification._();
//
//   static const String _id = '_ID';
//   static const String _channel = '_Channel';
//   static const String _description = '_Description';
//
//   static Future<void> setup() async {
//     //setup local notification
//     notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//
//     const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//     // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
//     // of the `IOSFlutterLocalNotificationsPlugin` class
//     final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
//         selectNotificationSubject.add(payload);
//         flutterLocalNotificationsPlugin.cancel(id);
//       },
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//     );
//   }
//
//   static Future<void> showNotification(String? title, String? body, String? payload) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(_id, _channel,
//         channelDescription: _description, importance: Importance.max, priority: Priority.high, ticker: 'ticker');
//     const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(0, '${title ?? 'Say hi!'} ', body ?? 'Nice to meet you again!', platformChannelSpecifics,
//         payload: payload);
//   }
//
//   static Future<void> onDidReceiveNotificationResponse(NotificationResponse details) async {
//     selectNotificationSubject.add(details.payload);
//   }
//
//   static Future<void> onDidReceiveBackgroundNotificationResponse(NotificationResponse details) async {
//     selectNotificationSubject.add(details.payload);
//   }
// }
