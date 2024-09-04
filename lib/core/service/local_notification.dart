import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../interface/service/local_notification.dart';

class LocalNotificationService implements ILocalNotificationService{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
        flutterLocalNotificationsPlugin.cancel(id);
      },
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Future<void> showNotification({required String title, required String body, required String payload}) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '_id',
        '_channel',
        channelDescription: '_description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
    );
    return flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        platformChannelSpecifics,
        payload: payload
    );
  }

}
