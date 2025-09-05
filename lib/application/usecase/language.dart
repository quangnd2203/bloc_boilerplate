import 'package:get/get.dart';
import 'package:flutter_app/domain/interface/repository/local_storage.dart';
import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/shared/constants/app_pref.dart';

class LanguageUseCase{

  final ILocalStorageRepository localStorageRepository = Get.find<ILocalStorageRepository>();

  void update(AppLocale locale) {
    localStorageRepository.saveData(AppPref.LANGUAGE.name, locale);
  }

  Future<AppLocale?> get() {
    return localStorageRepository.getData<AppLocale>(AppPref.LANGUAGE.name);
  }

}
