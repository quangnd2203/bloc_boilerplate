import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IFirebaseMessageService{
  Future<void> requestPermission();
  Future<void> setAutoInitEnabled(bool enabled);
  void subscribeToTopic(String topic);
  void unsubscribeFromTopic(String topic);
  void onBackgroundMessage(Future<void> Function(RemoteMessage mesage) callback);
  void onForegroundMessage(Future<void> Function(RemoteMessage mesage) callback);
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback);
  void onTokenRefresh(Future<void> Function(String token) callback);
  Future<String?> getFcmToken();
  Future<String?> getApnsToken();
}
