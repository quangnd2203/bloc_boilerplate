import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../utils/app_utils.dart';
import 'constants.dart';

ThemeData normalTheme(){
  return ThemeData(
    fontFamily: AppTextStyles.fontFamilyNotoSansJP,
    brightness: AppUtils.valueByMode(values: <Brightness>[Brightness.light, Brightness.dark]),
    scaffoldBackgroundColor: AppColors.bgLight,
    hintColor: HexColor.fromHex('#8898A5'),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.textGrey),
      thumbVisibility: MaterialStateProperty.all(true),
      radius: const Radius.circular(4),
      crossAxisMargin: 2,
    ),
  );
}

// ThemeData dark(){
//   return ThemeData(
//     fontFamily: AppTextStyles.fontFamilyNotoSansJP,
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.bgLight,
//     textTheme:
//   );
// }
