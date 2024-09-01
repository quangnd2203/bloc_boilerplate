import 'package:firebase_messaging/firebase_messaging.dart';
import '../../interface/service/firebase_message.dart';

class FirebaseMessageService implements IFirebaseMessageService{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<String?> getFcmToken() async {
    return _firebaseMessaging.getToken();
  }

  @override
  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission();
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
