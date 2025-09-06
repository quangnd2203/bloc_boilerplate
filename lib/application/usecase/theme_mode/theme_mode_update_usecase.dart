import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app/shared/constants/app_pref.dart';
import 'package:flutter_app/domain/interface/repository/i_local_storage_repository.dart';

class ThemeModeUpdateUseCase {
  ThemeModeUpdateUseCase();

  final ILocalStorageRepository _localStorageRepository = Get.find<ILocalStorageRepository>();

  void execute(ThemeMode mode) {
    _localStorageRepository.saveData(AppPref.THEME_MODE.name, mode);
  }
}
