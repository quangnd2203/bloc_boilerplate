import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../application/bloc/application/application_cubit.dart';
import '../../application/bloc/language/language_cubit.dart';
import '../../domain/usecase/language.dart';
import '../../domain/usecase/user.dart';
import '../../infrastructure/client/native_client.dart';
import '../../infrastructure/repository/local_storage.dart';
import '../../infrastructure/repository/user.dart';
import '../../infrastructure/service/wifi.dart';
import '../../interface/bloc/application.dart';
import '../../interface/bloc/language.dart';
import '../../interface/client/client.dart';
import '../../interface/repository/local_storage.dart';
import '../../interface/repository/user.dart';
import '../../interface/usecase/language.dart';
import '../../interface/usecase/user.dart';
import '../constants/app_values.dart';
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
    dependencyBloc();
    dependencyUseCase();
    dependencyRepository();
    dependencyService();
  }

  void dependencyBloc(){
    Get.lazyPut<IApplicationBloc>(() => ApplicationCubit());
    Get.lazyPut<ILanguageBloc>(() => LanguageCubit());
  }

  void dependencyUseCase(){
    Get.lazyPut<IUserUseCase>(() => UserUseCase());
    Get.lazyPut<ILanguageUseCase>(() => LanguageUseCase());
  }

  void dependencyRepository(){
    Get.lazyPut<IUserRepository>(() => UserRepository());
    Get.lazyPut<ILocalStorageRepository>(() => LocalStorageRepository());
  }

  void dependencyService(){
    Get.lazyPut<IWifiService>(() => WifiService());
  }

}