import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

import 'package:flutter_app/presentation/app.dart';
import 'package:flutter_app/shared/constants/app_values.dart';
import 'package:flutter_app/injection/injection.dart';

Future<void> main() async {
  await dotenv.load();
  await Firebase.initializeApp();
  Injection.injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en');
  initializeDateFormatting('vi');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: true,
  ));
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  flavor = (await const MethodChannel('flavor').invokeMethod<String>('getFlavor'))!;
  Logger().d('RUNNING IN $flavor ENVIRONMENT'.toUpperCase());
  runApp(const App());
}
