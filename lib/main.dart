// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/constants/constants.dart';
import 'app/resources/service/firebase_service.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/ui/widgets/widgets.dart';
import 'app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  if (FLAVOR != 'dev') {
    await FirebaseService().init();
  }
  await AppPrefs.initListener();
  // await notificationInitialed();
  Logger().d('RUNNING IN $FLAVOR ENVIRONMENT'.toUpperCase());
  // Logger().d('FCM TOKEN: ${await FirebaseCloudMessaging.getFCMToken()}');
  runApp(const RestartWidget(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(initialThemeData: normalTheme(context), child: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AppDeviceInfo.init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('ChangeAppLifecycleState: $state');
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      // child: GetMaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeSwitcher.of(context).themeData,
      //   title: APP_NAME,
      //   initialRoute: Routes.SPLASH,
      //   defaultTransition: Transition.cupertino,
      //   getPages: AppPages.pages,
      //   locale: AppLocale.vi.value,
      //   translationsKeys: AppTranslation.translations,
      //   // navigatorObservers: <NavigatorObserver>[MyApp.observer],
      // ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeSwitcher.of(context).themeData,
        title: APP_NAME.tr,
        initialRoute: Routes.SPLASH,
        locale: AppLocale.vi.value,
        localizationsDelegates: ,
      ),
    );
  }
}
