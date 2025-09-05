import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

// Bloc imports
import 'package:flutter_app/application/bloc/application/application_cubit.dart';
import 'package:flutter_app/application/bloc/language/language_cubit.dart';
import 'package:flutter_app/application/bloc/theme/theme_cubit.dart';

// Repository imports
import 'package:flutter_app/adapter/client/native_client.dart';
import 'package:flutter_app/adapter/repository/user.dart';
import 'package:flutter_app/adapter/repository/local_storage.dart';
import 'package:flutter_app/domain/interface/client/client.dart';
import 'package:flutter_app/domain/interface/repository/user.dart';
import 'package:flutter_app/domain/interface/repository/local_storage.dart';

// Service imports
import 'package:flutter_app/adapter/service/wifi.dart';
import 'package:flutter_app/adapter/service/logger.dart';
import 'package:flutter_app/adapter/service/crashlytics.dart';
import 'package:flutter_app/adapter/service/firebase_message.dart';
import 'package:flutter_app/adapter/service/local_notification.dart';
import 'package:flutter_app/domain/interface/service/wifi.dart';
import 'package:flutter_app/domain/interface/service/logger.dart';
import 'package:flutter_app/domain/interface/service/crashlytics.dart';
import 'package:flutter_app/domain/interface/service/firebase_message.dart';
import 'package:flutter_app/domain/interface/service/local_notification.dart';

// Constants
import 'package:flutter_app/shared/constants/app_values.dart';

class Injection {
  static void injectDependencies() {
    _dependencyBloc();
    _dependencyRepository();
    _dependencyService();
  }

  static void _dependencyBloc() {
    Get.lazyPut<ApplicationCubit>(() => ApplicationCubit());
    Get.lazyPut<LanguageCubit>(() => LanguageCubit());
    Get.lazyPut<ThemeCubit>(() => ThemeCubit());
  }

  static void _dependencyRepository() {
    Get.lazyPut<IClient>(() {
      late final String baseUrl;
      if (flavor == 'dev') {
        baseUrl = dotenv.env['BASE_URL_DEV'].toString();
      } else {
        baseUrl = dotenv.env['BASE_URL_PROD'].toString();
      }
      return NativeClient(baseUrl: baseUrl);
    });
    Get.lazyPut<IUserRepository>(() => UserRepository());
    Get.lazyPut<ILocalStorageRepository>(() => LocalStorageRepository());
  }

  static void _dependencyService() {
    Get.lazyPut<IWifiService>(() => WifiService());
    Get.lazyPut<ILoggerService>(() => LoggerService());
    Get.lazyPut<ICrashlyticsService>(() => CrashlyticsService());
    Get.lazyPut<IFirebaseMessageService>(() => FirebaseMessageService());
    Get.lazyPut<ILocalNotificationService>(() => LocalNotificationService());
  }
}
