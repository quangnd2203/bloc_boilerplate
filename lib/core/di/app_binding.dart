import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../application/bloc/application/application_cubit.dart';
import '../../application/bloc/language/language_cubit.dart';
import '../../application/bloc/theme/theme_cubit.dart';
import '../../domain/usecase/language.dart';
import '../../domain/usecase/notification.dart';
import '../../domain/usecase/theme_mode.dart';
import '../../domain/usecase/user.dart';
import '../../infrastructure/client/native_client.dart';
import '../../infrastructure/repository/local_storage.dart';
import '../../infrastructure/repository/user.dart';
import '../../interface/bloc/application/application_cubit.dart';
import '../../interface/bloc/language/language_cubit.dart';
import '../../interface/service/crashlytics.dart';
import '../../interface/service/firebase_message.dart';
import '../../interface/service/local_notification.dart';
import '../../interface/service/logger.dart';
import '../../interface/service/wifi.dart';
import '../../interface/bloc/theme/theme_cubit.dart';
import '../../interface/client/client.dart';
import '../../interface/repository/local_storage.dart';
import '../../interface/repository/user.dart';
import '../../interface/usecase/language.dart';
import '../../interface/usecase/notification.dart';
import '../../interface/usecase/theme_mode.dart';
import '../../interface/usecase/user.dart';
import '../constants/app_values.dart';
import '../service/crashlytics.dart';
import '../service/firebase_message.dart';
import '../service/local_notification.dart';
import '../service/logger.dart';
import '../service/wifi.dart';

class AppBinding extends Bindings{

  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.lazyPut<GetStorage>(() => GetStorage('AppPref'));
    Get.lazyPut<Connectivity>(() => Connectivity());
    Get.lazyPut<IClient>(() {
      late final String baseUrl;
      if(flavor == 'dev'){
        baseUrl = dotenv.env['BASE_URL_DEV'].toString();
      }else{
        baseUrl = dotenv.env['BASE_URL_PROD'].toString();
      }
      return NativeClient(baseUrl: baseUrl);
    });
    dependencyService();
    dependencyBloc();
    dependencyUseCase();
    dependencyRepository();
  }

  void dependencyBloc(){
    Get.lazyPut<IApplicationCubit>(() => ApplicationCubit());
    Get.lazyPut<ILanguageCubit>(() => LanguageCubit());
    Get.lazyPut<IThemeCubit>(() => ThemeCubit());
  }

  void dependencyUseCase(){
    Get.lazyPut<IUserUseCase>(() => UserUseCase());
    Get.lazyPut<ILanguageUseCase>(() => LanguageUseCase());
    Get.lazyPut<IThemeModeUseCase>(() => ThemeModeUseCase());
    Get.lazyPut<INotificationUseCase>(() => NotificationUseCase());
  }

  void dependencyRepository(){
    Get.lazyPut<IUserRepository>(() => UserRepository());
    Get.lazyPut<ILocalStorageRepository>(() => LocalStorageRepository());
  }

  void dependencyService(){
    Get.lazyPut<IWifiService>(() => WifiService());
    Get.lazyPut<ILoggerService>(() => LoggerService());
    Get.lazyPut<ICrashlyticsService>(() => CrashlyticsService());
    Get.lazyPut<IFirebaseMessageService>(() => FirebaseMessageService());
    Get.lazyPut<ILocalNotificationService>(() => LocalNotificationService());
  }

}
