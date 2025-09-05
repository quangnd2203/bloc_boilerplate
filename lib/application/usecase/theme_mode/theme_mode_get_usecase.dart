import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app/shared/constants/app_pref.dart';
import 'package:flutter_app/domain/interface/repository/local_storage.dart';

class ThemeModeGetUseCase {
  ThemeModeGetUseCase();

  final ILocalStorageRepository _localStorageRepository = Get.find<ILocalStorageRepository>();

  Future<ThemeMode?> execute() {
    return _localStorageRepository.getData(AppPref.THEME_MODE.name);
  }
}
