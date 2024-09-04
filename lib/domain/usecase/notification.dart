import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../interface/service/firebase_message.dart';
import '../../interface/service/logger.dart';
import '../../interface/usecase/notification.dart';

class NotificationUseCase implements INotificationUseCase{

  final IFirebaseMessageService firebaseMessageService = Get.find<IFirebaseMessageService>();
  final ILoggerService loggerService = Get.find<ILoggerService>();

  @override
  Future<String?> getFcmToken() {
    return firebaseMessageService.getFcmToken();
  }

  @override
  Future<void> initialize() async {
    await firebaseMessageService.requestPermission();
    await firebaseMessageService.setAutoInitEnabled(true);
    firebaseMessageService.getFcmToken().then((value){
      loggerService.debug('FCM Token: $value');
    });
    onForegroundMessage();
  }

  @override
  void onForegroundMessage() {
    firebaseMessageService.onForegroundMessage((RemoteMessage message) async {
      loggerService.debug('onForegroundMessage: ${message.data}');
    });
  }

  /*
  This method is used to handle when user press notification to open the app
  * */
  @override
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback) {
    firebaseMessageService.onMessageOpenedApp(callback);
  }

  @override
  void subscribeToTopic(String topic) {
    firebaseMessageService.subscribeToTopic(topic);
  }

  @override
  void unsubscribeFromTopic(String topic) {
    firebaseMessageService.unsubscribeFromTopic(topic);
  }

}
