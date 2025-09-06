import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/i_firebase_message_service.dart';
import 'package:flutter_app/domain/interface/service/i_local_notification_service.dart';
import 'package:flutter_app/domain/interface/service/i_logger_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationInitializeUseCase {
  NotificationInitializeUseCase();

  final IFirebaseMessageService _firebaseMessageService = Get.find<IFirebaseMessageService>();
  final ILoggerService _loggerService = Get.find<ILoggerService>();
  final ILocalNotificationService _localNotificationService = Get.find<ILocalNotificationService>();

  Future<void> execute() async {
    await _firebaseMessageService.requestPermission();
    await _firebaseMessageService.setAutoInitEnabled(true);
    _firebaseMessageService.getFcmToken().then((String? value){
      _loggerService.debug('FCM Token: $value');
    });
    await _localNotificationService.initialize();
    _onForegroundMessage();
  }

  void _onForegroundMessage() {
    _firebaseMessageService.onForegroundMessage((RemoteMessage message) async {
      _loggerService.debug('onForegroundMessage: ${message.data}');
      _localNotificationService.showNotification(
        title: message.notification?.title ?? '', 
        body: message.notification?.body ?? '', 
        payload: message.data.toString()
      );
    });
  }
}
