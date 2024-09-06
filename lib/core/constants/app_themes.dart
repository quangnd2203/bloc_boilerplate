import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFF003E47),
    secondaryHeaderColor: const Color(0xFFCFEC7E),
    highlightColor: const Color(0xFF003E47),
    primaryColorDark: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF003E47)),
      titleSmall: TextStyle(color: Color(0xFF25282D)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.themeLightBackgroundColor,
    ),
  );

  static ThemeData dark = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFF689da7),
    brightness: Brightness.dark,
    secondaryHeaderColor: const Color(0xFFaaa818),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF8dbac3)),
      titleSmall: TextStyle(color: Color(0xFF25282D)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: AppColors.themeDarkBackgroundColor,
    ),
  );
}
