import 'package:firebase_messaging/firebase_messaging.dart';

abstract class INotificationUseCase{
  Future<void> initialize();
  Future<String?> getFcmToken();
  void subscribeToTopic(String topic);
  void unsubscribeFromTopic(String topic);
  void onForegroundMessage();
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback);
}
