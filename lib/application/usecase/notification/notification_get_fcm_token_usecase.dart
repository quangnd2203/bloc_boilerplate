import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/i_firebase_message_service.dart';

class NotificationGetFcmTokenUseCase {
  NotificationGetFcmTokenUseCase();

  final IFirebaseMessageService _firebaseMessageService = Get.find<IFirebaseMessageService>();

  Future<String?> execute() {
    return _firebaseMessageService.getFcmToken();
  }
}
