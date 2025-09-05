<<<<<<< HEAD
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_themes.dart';
import '../../../interface/bloc/theme/theme_cubit.dart';
import '../../../interface/usecase/theme_mode.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<IThemeState> implements IThemeCubit{
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/shared/constants/app_themes.dart';
import 'package:flutter_app/application/usecase/theme_mode.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
>>>>>>> migration
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

<<<<<<< HEAD
  final IThemeModeUseCase themeModeUseCase = Get.find<IThemeModeUseCase>();

  @override
=======
  final ThemeModeUseCase themeModeUseCase = Get.find<ThemeModeUseCase>();

>>>>>>> migration
  void changeThemeMode(ThemeMode mode) {
    emit(state.copyWith(mode: mode));
    themeModeUseCase.update(mode);
  }
}
