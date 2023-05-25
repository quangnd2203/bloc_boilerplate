// ignore_for_file: always_specify_types, strict_raw_type

import 'package:get/get.dart';

import '../ui/splash/splash.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: Routes.SETTING_NOTIFICATION_DETAIL,
    //   page: () => SettingNotificationDetailScreen(),
    //   binding: SettingNotificationDetailBinding(),
    //   title: 'notification_settings_title',
    // ),
  ];
}
