import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/shared/constants/app_pref.dart';
import 'package:flutter_app/domain/interface/repository/local_storage.dart';

class ThemeModeUseCase {
  final ILocalStorageRepository localStorageRepository = Get.find<ILocalStorageRepository>();

  Future<ThemeMode?> get() {
    return localStorageRepository.getData(AppPref.THEME_MODE.name);
  }

  void update(ThemeMode mode) {
    localStorageRepository.saveData(AppPref.THEME_MODE.name, mode);
  }
}
