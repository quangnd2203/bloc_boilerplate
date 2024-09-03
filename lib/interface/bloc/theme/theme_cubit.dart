import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

abstract class IThemeCubit implements Cubit<IThemeState> {
  void changeThemeMode(ThemeMode mode);
}
