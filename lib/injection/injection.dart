import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

// Bloc imports
import 'package:flutter_app/application/bloc/application/application_cubit.dart';
import 'package:flutter_app/application/bloc/language/language_cubit.dart';
import 'package:flutter_app/application/bloc/theme/theme_cubit.dart';

// Repository imports
import 'package:flutter_app/adapter/client/native_client.dart';
import 'package:flutter_app/adapter/repository/user_repository.dart';
import 'package:flutter_app/adapter/repository/local_storage_repository.dart';
import 'package:flutter_app/domain/interface/client/i_client.dart';
import 'package:flutter_app/domain/interface/repository/i_user_repository.dart';
import 'package:flutter_app/domain/interface/repository/i_local_storage_repository.dart';

// Service imports
import 'package:flutter_app/adapter/service/wifi_service.dart';
import 'package:flutter_app/adapter/service/logger_service.dart';
import 'package:flutter_app/adapter/service/crashlytics_service.dart';
import 'package:flutter_app/adapter/service/firebase_message_service.dart';
import 'package:flutter_app/adapter/service/local_notification_service.dart';
import 'package:flutter_app/domain/interface/service/i_wifi_service.dart';
import 'package:flutter_app/domain/interface/service/i_logger_service.dart';
import 'package:flutter_app/domain/interface/service/i_crashlytics_service.dart';
import 'package:flutter_app/domain/interface/service/i_firebase_message_service.dart';
import 'package:flutter_app/domain/interface/service/i_local_notification_service.dart';

// Use Case imports
import 'package:flutter_app/application/usecase/language/language_get_usecase.dart';
import 'package:flutter_app/application/usecase/language/language_update_usecase.dart';
import 'package:flutter_app/application/usecase/theme_mode/theme_mode_get_usecase.dart';
import 'package:flutter_app/application/usecase/theme_mode/theme_mode_update_usecase.dart';
import 'package:flutter_app/application/usecase/user/user_get_usecase.dart';
import 'package:flutter_app/application/usecase/user/user_get_all_usecase.dart';
import 'package:flutter_app/application/usecase/notification/notification_initialize_usecase.dart';
import 'package:flutter_app/application/usecase/notification/notification_get_fcm_token_usecase.dart';
import 'package:flutter_app/application/usecase/notification/notification_subscribe_topic_usecase.dart';
import 'package:flutter_app/application/usecase/notification/notification_unsubscribe_topic_usecase.dart';


// Constants
import 'package:flutter_app/shared/constants/app_values.dart';

class Injection {
  static void injectDependencies() {
    _dependencyBloc();
    _dependencyRepository();
    _dependencyService();
    _dependencyUseCase();
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

  static void _dependencyUseCase() {
    // Language Use Cases
    Get.lazyPut<LanguageGetUseCase>(() => LanguageGetUseCase());
    Get.lazyPut<LanguageUpdateUseCase>(() => LanguageUpdateUseCase());
    
    // Theme Mode Use Cases
    Get.lazyPut<ThemeModeGetUseCase>(() => ThemeModeGetUseCase());
    Get.lazyPut<ThemeModeUpdateUseCase>(() => ThemeModeUpdateUseCase());
    
    // User Use Cases
    Get.lazyPut<UserGetUseCase>(() => UserGetUseCase());
    Get.lazyPut<UserGetAllUseCase>(() => UserGetAllUseCase());
    
    // Notification Use Cases
    Get.lazyPut<NotificationInitializeUseCase>(() => NotificationInitializeUseCase());
    Get.lazyPut<NotificationGetFcmTokenUseCase>(() => NotificationGetFcmTokenUseCase());
    Get.lazyPut<NotificationSubscribeTopicUseCase>(() => NotificationSubscribeTopicUseCase());
    Get.lazyPut<NotificationUnsubscribeTopicUseCase>(() => NotificationUnsubscribeTopicUseCase());
  }
}
