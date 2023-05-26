import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../constants/app_themes.dart';
import '../../utils/app_pref.dart';
import '../application/application_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(mode: AppPrefs.themeMode ?? ThemeMode.light, lightTheme: light, darkTheme: dark));

  Future<void> changeThemeMode(ThemeMode mode) async {
    Get.find<ApplicationCubit>().setLoading();
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    Get.find<ApplicationCubit>().setLoading(false);
    final ThemeState newState = state.copyWith(mode: mode);
    emit(newState);
  }
}
