import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../constants/app_themes.dart';
import '../../utils/app_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            mode: ThemeMode.values.firstWhere((ThemeMode e) => e.name == AppPrefs.themeMode, orElse: () => ThemeMode.light),
            lightTheme: AppThemes.light,
            darkTheme: AppThemes.dark,
          ),
        );

  bool get isDarkMode => state.mode == ThemeMode.dark;

  void changeThemeMode(ThemeMode mode) {
    final ThemeState newState = state.copyWith(mode: mode);
    emit(newState);
    AppPrefs.themeMode = mode.name;
  }

  // void onChangeConfig(ConfigModel? config) {
  //   if (config != null) {
  //     final AppThemeModel? light = config.lightTheme;
  //     final AppThemeModel? dark = config.darkTheme;
  //     final ThemeState newState = state.copyWith(
  //       lightTheme: light?.toThemeData(),
  //       darkTheme: dark?.toThemeData(brightness: Brightness.dark),
  //     );
  //     emit(newState);
  //   }
  // }
}
