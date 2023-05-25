import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../constants/app_themes.dart';
import '../../utils/app_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(mode: AppPrefs.themeMode ?? ThemeMode.light, lightTheme: light, darkTheme: dark));

  void changeThemeMode(ThemeMode mode) {
    final ThemeState newState = state.copyWith(mode: mode);
    emit(newState);
  }
}
