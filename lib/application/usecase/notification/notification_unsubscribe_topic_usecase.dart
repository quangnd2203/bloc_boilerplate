import 'package:get/get.dart';

import 'package:flutter_app/domain/interface/service/firebase_message.dart';

class NotificationUnsubscribeTopicUseCase {
  NotificationUnsubscribeTopicUseCase();

  final IFirebaseMessageService _firebaseMessageService = Get.find<IFirebaseMessageService>();

  void execute(String topic) {
    _firebaseMessageService.unsubscribeFromTopic(topic);
  }
}
