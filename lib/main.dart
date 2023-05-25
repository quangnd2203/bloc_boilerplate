// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';
import 'app/constants/constants.dart';
import 'app/ui/ui.dart';
import 'app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  if (FLAVOR != 'dev') {
    // await FirebaseService().init();
  }
  await AppPrefs.initListener();
  // await notificationInitialed();
  Logger().d('RUNNING IN $FLAVOR ENVIRONMENT'.toUpperCase());
  // Logger().d('FCM TOKEN: ${await FirebaseCloudMessaging.getFCMToken()}');
  runApp(const App());
}

