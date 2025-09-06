import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/domain/interface/service/i_firebase_message_service.dart';

class FirebaseMessageService implements IFirebaseMessageService{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<String?> getFcmToken() async {
    return _firebaseMessaging.getToken();
  }

  @override
  Future<String?> getApnsToken() async {
    return _firebaseMessaging.getAPNSToken();
  }

  @override
  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission();
  }

  @override
  Future<void> setAutoInitEnabled(bool enabled) async {
    await _firebaseMessaging.setAutoInitEnabled(enabled);
  }

  @override
  void subscribeToTopic(String topic) {
    _firebaseMessaging.subscribeToTopic(topic);
  }

  @override
  void unsubscribeFromTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  @override
  void onTokenRefresh(Future<void> Function(String token) callback) {
    _firebaseMessaging.onTokenRefresh.listen(callback);
  }

  @override
  void onForegroundMessage(Future<void> Function(RemoteMessage mesage) callback) {
    FirebaseMessaging.onMessage.listen(callback);
  }

  @override
  void onBackgroundMessage(Future<void> Function(RemoteMessage mesage) callback) {
    FirebaseMessaging.onBackgroundMessage(callback);
  }

  @override
  void onMessageOpenedApp(Future<void> Function(RemoteMessage mesage) callback) {
    FirebaseMessaging.onMessageOpenedApp.listen(callback);
  }

}
