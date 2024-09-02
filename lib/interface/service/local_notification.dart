abstract class ILocalNotificationService{
  Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  });
  Future<void> initialize();
}
