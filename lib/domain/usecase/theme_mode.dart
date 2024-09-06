import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_pref.dart';
import '../../interface/repository/local_storage.dart';
import '../../interface/usecase/theme_mode.dart';

class ThemeModeUseCase implements IThemeModeUseCase{

  final ILocalStorageRepository localStorageRepository = Get.find<ILocalStorageRepository>();

  @override
  Future<ThemeMode?> get() {
    return localStorageRepository.getData(AppPref.THEME_MODE.name);
  }

  @override
  void update(ThemeMode mode) {
    localStorageRepository.saveData(AppPref.THEME_MODE.name, mode);
  }

}
