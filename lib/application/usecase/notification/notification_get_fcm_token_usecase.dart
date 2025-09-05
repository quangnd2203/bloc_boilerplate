import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/firebase_message.dart';

class NotificationGetFcmTokenUseCase {
  NotificationGetFcmTokenUseCase();

  final IFirebaseMessageService _firebaseMessageService = Get.find<IFirebaseMessageService>();

  Future<String?> execute() {
    return _firebaseMessageService.getFcmToken();
  }
}
