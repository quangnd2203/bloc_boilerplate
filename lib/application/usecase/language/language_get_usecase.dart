import 'package:get/get.dart';

import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/shared/constants/app_pref.dart';
import 'package:flutter_app/domain/interface/repository/i_local_storage_repository.dart';

class LanguageGetUseCase {
  LanguageGetUseCase();

  final ILocalStorageRepository _localStorageRepository = Get.find<ILocalStorageRepository>();

  Future<AppLocale?> execute() {
    return _localStorageRepository.getData<AppLocale>(AppPref.LANGUAGE.name);
  }
}
