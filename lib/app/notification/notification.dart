//
// // ignore_for_file: strict_raw_type, avoid_print, always_specify_types
// import 'dart:async';
// import 'dart:convert';
// import 'package:rxdart/rxdart.dart';
// import 'firebase_messaging.dart';
// import 'local_notification.dart';
// import 'notification_data.dart';
//
// Future<void>  notificationInitialed() async {
//   FirebaseCloudMessaging.initFirebaseMessaging();
//   LocalNotification.setup();
// }
//
// final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();
// final BehaviorSubject<bool> notificationSubject = BehaviorSubject<bool>();
//
// StreamSubscription? _subscription;
//
// void configureSelectNotificationSubject(Function(Data payloadData) redirect) {
//   _subscription = selectNotificationSubject.stream.listen((String? payload) async {
//         if (payload != null){
//           try {
//             final Data data = Data.fromJson(jsonDecode(payload) as Map<String, dynamic>?);
//             redirect(data);
//           } catch (e) {
//             print('Error redirect by notification: $e');
//           } finally {
//             selectNotificationSubject.add(null);
//           }
//         }
//       });
// }
//
// void unConfigureSelectNotificationSubject() {
//   _subscription?.cancel();
//   _subscription = null;
// }
