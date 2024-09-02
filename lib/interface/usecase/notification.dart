import 'package:firebase_messaging/firebase_messaging.dart';

abstract class INotificationUseCase{
  Future<void> initialize();
  Future<String?> getFcmToken();
  Future<void> requestPermission();
  void subscribeToTopic(String topic);
  void unsubscribeFromTopic(String topic);
  void onForegroundMessage(Future<void> Function(RemoteMessage mesage) callback);
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback);
}
