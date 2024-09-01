import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IFirebaseMessageService{
  Future<void> requestPermission();
  void subscribeToTopic(String topic);
  void unsubscribeFromTopic(String topic);
  void onForegroundMessage(Future<void> Function(RemoteMessage mesage) callback);
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback);
  Future<String?> getFcmToken();
}
