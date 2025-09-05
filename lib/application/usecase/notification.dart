import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/firebase_message.dart';
import 'package:flutter_app/domain/interface/service/local_notification.dart';
import 'package:flutter_app/domain/interface/service/logger.dart';

class NotificationUseCase{

  final IFirebaseMessageService firebaseMessageService = Get.find<IFirebaseMessageService>();
  final ILoggerService loggerService = Get.find<ILoggerService>();
  final ILocalNotificationService localNotificationService = Get.find<ILocalNotificationService>();

  Future<String?> getFcmToken() {
    return firebaseMessageService.getFcmToken();
  }

  Future<void> initialize() async {
    await firebaseMessageService.requestPermission();
    await firebaseMessageService.setAutoInitEnabled(true);
    firebaseMessageService.getFcmToken().then((String? value){
      loggerService.debug('FCM Token: $value');
    });
    await localNotificationService.initialize();
    onForegroundMessage();
  }

  void onForegroundMessage() {
    firebaseMessageService.onForegroundMessage((RemoteMessage message) async {
      loggerService.debug('onForegroundMessage: ${message.data}');
      localNotificationService.showNotification(title: message.notification?.title ?? '', body: message.notification?.body ?? '', payload: message.data.toString());
    });
  }

  /*
  This method is used to handle when user press notification to open the app
  * */
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback) {
    firebaseMessageService.onMessageOpenedApp(callback);
  }

  void subscribeToTopic(String topic) {
    firebaseMessageService.subscribeToTopic(topic);
  }

  void unsubscribeFromTopic(String topic) {
    firebaseMessageService.unsubscribeFromTopic(topic);
  }

}
