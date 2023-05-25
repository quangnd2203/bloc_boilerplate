import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../constants/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(normalTheme());

  void changeTheme(ThemeData theme){
    emit(theme);
  }
}

