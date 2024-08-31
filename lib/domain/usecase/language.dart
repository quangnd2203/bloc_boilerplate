import 'package:get/get.dart';

import '../../core/constants/app_pref.dart';
import '../../core/constants/app_values.dart';
import '../../interface/repository/local_storage.dart';
import '../../interface/usecase/language.dart';

class LanguageUseCase implements ILanguageUseCase{

  final ILocalStorageRepository localStorageRepository = Get.find<ILocalStorageRepository>();

  @override
  void update(AppLocale locale) {
    localStorageRepository.saveData(AppPref.LANGUAGE.name, locale);
  }

  @override
  Future<AppLocale?> get() {
    return localStorageRepository.getData<AppLocale>(AppPref.LANGUAGE.name);
  }

}
