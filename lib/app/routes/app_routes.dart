part of './app_pages.dart';

abstract class Routes {
  static const String SPLASH = '/';

  static const String LOGIN = '/login';
  static const String REGISTER_EMAIL = '/register_email';
  static const String RESET_PASSWORD = '/reset_password';

  static const String DASH_BOARD = '/dash_board';
  static const String DOOR_CREATE_SETTING = '/door_create_setting';
  static const String DOOR_GROUP_DETAIL = '/door_group_detail';
  static const String HISTORY = '/history';
  static const String DEVICE_DETAIL = '/device_detail';
  static const String CREATE_NEW_DEVICE = '/create_new_device';
  static const String DOOR_LIST = '/door_list';
  static const String ACCOUNT_SETTING = '/account_setting';
  static const String USER_SETTING_GROUP = '/user_setting_group';
  static const String USER_SETTING_SUBORDINATE = '/user_setting_subordinate';
  // static const String NOTIFICATION_SETTINGS = '/notification_settings';
  static const String NOTIFICATION_LIST = '/notification_list';
  static const String USER_DETAIL = '/user_detail';

  static const String CONTACT = '/contact';
  static const String INITIAL = '/';
  static const String DEVICE_LIST = '/device_list';
  static const String USER_LIST = '/user_list';
  static const String NEWS_DETAIL = '/news_detail';

  static const String DEVICE_MANAGE_GETWAY =
      '/device_detail/device_manager_setting_dialog';

  static const String SETTING_NOTIFICATION_DETAIL = '/setting_notification_detail';
  static const String SETTING_NOTIFICATION_EVENT = '/setting_notification_event';
  static const String SETTING_NOTIFICATION_DOORS = '/setting_notification_doors';
  static const String SETTING_NOTIFICATION_USERS = '/setting_notification_users';
  static const String EXISTING_ACCOUNT = '/existing_account';

}
