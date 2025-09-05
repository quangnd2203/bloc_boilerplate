import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/shared/constants/app_themes.dart';
import 'package:flutter_app/application/usecase/theme_mode/theme_mode_get_usecase.dart';
import 'package:flutter_app/application/usecase/theme_mode/theme_mode_update_usecase.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeState(
    mode: ThemeMode.light,
    lightTheme: AppThemes.light,
    darkTheme: AppThemes.dark,
  )){
    _themeModeGetUseCase.execute().then((ThemeMode? value){
      if(value != null){
        emit(state.copyWith(mode: value));
      }
    });
  }

  final ThemeModeGetUseCase _themeModeGetUseCase = Get.find<ThemeModeGetUseCase>();
  final ThemeModeUpdateUseCase _themeModeUpdateUseCase = Get.find<ThemeModeUpdateUseCase>();

  void changeThemeMode(ThemeMode mode) {
    emit(state.copyWith(mode: mode));
    _themeModeUpdateUseCase.execute(mode);
  }
}
