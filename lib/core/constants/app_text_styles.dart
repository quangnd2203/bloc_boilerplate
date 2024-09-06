import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFontSize {
  static const double fontTextTitle = 22.0;
  static const double fontTextBig = 20.0;
  static const double fontText = 16.0;
  static const double fontTextSmall = 13.0;
  static const double fontExtraSmall = 8.0;
  static const double fontTextExtraBig = 31;
  static const double fontErrorText = 14;
  static const double fontHeight = 1.2;
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get regular => GoogleFonts.roboto().copyWith(
        height: AppFontSize.fontHeight,
        color: AppColors.text,
        fontWeight: FontWeight.w300,
        fontSize: AppFontSize.fontText,
      );

  static TextStyle get medium => GoogleFonts.roboto().copyWith(
        fontSize: AppFontSize.fontText,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bold => GoogleFonts.roboto().copyWith(
        fontSize: AppFontSize.fontText,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get black => GoogleFonts.roboto().copyWith(
        fontSize: AppFontSize.fontText,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get rubikLight => GoogleFonts.rubik().copyWith(
    height: AppFontSize.fontHeight,
    color: AppColors.text,
    fontWeight: FontWeight.w300,
    fontSize: AppFontSize.fontText,
  );

  static TextStyle get rubikRegular => GoogleFonts.rubik().copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get rubikMedium => GoogleFonts.rubik().copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get rubikSemiBold => GoogleFonts.rubik().copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w600,
  );
}
