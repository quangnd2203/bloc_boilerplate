import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/i_firebase_message_service.dart';

class NotificationSubscribeTopicUseCase {
  NotificationSubscribeTopicUseCase();

  final IFirebaseMessageService _firebaseMessageService = Get.find<IFirebaseMessageService>();

  void execute(String topic) {
    _firebaseMessageService.subscribeToTopic(topic);
  }
}
