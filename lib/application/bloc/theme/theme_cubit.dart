import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_themes.dart';
import '../../../interface/bloc/theme/theme_cubit.dart';
import '../../../interface/usecase/theme_mode.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<IThemeState> implements IThemeCubit{
  ThemeCubit() : super(ThemeState(
    mode: ThemeMode.light,
    lightTheme: AppThemes.light,
    darkTheme: AppThemes.dark,
  )){
    themeModeUseCase.get().then((ThemeMode? value){
      if(value != null){
        emit(state.copyWith(mode: value));
      }
    });
  }

  final IThemeModeUseCase themeModeUseCase = Get.find<IThemeModeUseCase>();

  @override
  void changeThemeMode(ThemeMode mode) {
    emit(state.copyWith(mode: mode));
    themeModeUseCase.update(mode);
  }
}
