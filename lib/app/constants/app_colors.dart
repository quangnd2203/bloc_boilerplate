import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../blocs/theme/theme_cubit.dart';
import '../extensions/extensions.dart';

class AppColors {
  AppColors._();

  static Color get primary => HexColor.fromHex('#FF6915');

  static Color get primaryDark => HexColor.fromHex('#FF6915');

  static Color get primaryLight => HexColor.fromHex('#FF6915');

  static Color get text => HexColor.fromHex('#333333');

  static Color get bgLight => HexColor.fromHex('#F0F4F7');

  static Color get bgBold => HexColor.fromHex('#E6EEF5');

  static Color get borderLight => HexColor.fromHex('#D4DEE5');

  static Color get textGrey => HexColor.fromHex('#73808A');

  static Color get bluePrimary => HexColor.fromHex('#036FC2');

  static Color get shadow => HexColor.fromHex('#A0B0BC');

  static Color get shadowLight => HexColor.fromHex('#F0F3F5');

  static Color get blueButton => HexColor.fromHex('#036FC2');

  static Color get redPrimary => HexColor.fromHex('#D03C39');

  static Color get valueText => HexColor.fromHex('#333333');

  /////

  static Color get themeLightBackgroundColor => const Color(0xFFFAFAFA);

  static Color get themeDarkBackgroundColor => const Color(0xFF343636);

  static Color get getOnboardGreyColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFe9e8f5) : const Color(0xFF6D6D78);

  static Color get getWhiteAndBlack => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  static Color get getCardBackground => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF343636) : const Color(0xFFFFFFFF);

  static Color get getScaffoldBackground => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF000000) : HexColor.fromHex('#F8F8F8');

  static Color get textFieldBorderColor => const Color(0xFFD1D1D6);

  static Color get getRedColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFbd0a00) : const Color(0xFFff795b);

  static Color get getTransactionTrilingColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF84b1cc) : const Color(0xFF344968);

  static Color get getTextColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFE4E8EC) : const Color(0xFF25282B);

  static Color get getGreyBaseGray6 => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFb2b5c8) : const Color(0xFFF2F2F7);

  static Color get getShadowColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFeeeeee) : const Color(0xFF757575);

  static Color get genderDefaultColor => const Color(0xFFe3f3fd);

  static Color get getAcceptBtn => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF065802) : const Color(0xFF95CD41);

  static Color get getBlackAndWhite => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF606060);

  static const Map<int, Color> colorMap = <int, Color>{
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };

  static Color get gradientColor => const Color(0xFF45A735);

  static Color get secondaryColor => const Color(0xFFE0EC53);

  static Color get nevDefaultColor => const Color(0xFFAAAAAA);

  static Color get getGreyBaseGray1 => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFd3d3d8) : const Color(0xFF8E8E93);

  static Color get scaffoldDefaultColor => HexColor.fromHex('#fafafa');

  static Color get getWebsiteTextColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF84b1cc) : const Color(0xFF344968);

  static Color get getGreyBaseGray3 => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF757575) : const Color(0xFFC7C7CC);

  static Color get getBackgroundColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF343636) : const Color(0xFFFAFAFA);

  static Color get getNoteTextColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF25282B) : const Color(0xFF14684E);

  static Color get getTransactionTitleColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF71a8c1) : const Color(0xFF174061);

  static Color get getGreyBaseGray4 => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFe3e3e8) : const Color(0xFFD1D1D6);

  static Color get getAddMoneyCardColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF398343) : const Color(0xFFACD9B3);

  static Color get getHintColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF98a1ab) : const Color(0xFF808080);

  static Color get getKeepingColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFbd0a00) : const Color(0xFF14684E);

  static Color get getSearchBg => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF585a5c) : const Color(0xFFF4F7FC);

  static Color get getPrimaryColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF002931) : const Color(0xFF003E47);

  static Color get cardOrangeColor => const Color(0xFFFFCB66);

  static Color get phoneNumberColor => const Color(0xFF484848);

  static List<Color> get ssColor => <Color>[
        const Color(0xFF008926),
        const Color(0xFF5CAE7F),
        const Color(0xFF008926),
        const Color(0xFF008926),
        const Color(0xFF5CAE7D),
        const Color(0xFF008926),
      ];

  static Color get getBalanceTextColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFd7d7d7) : const Color(0xFF393939);

  static Color get getRequestMoneyCardColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFa900a0) : const Color(0xFFF6BDE9);

  static Color get getReferFriendCardColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF0083cf) : const Color(0xFFADE4FD);

  static Color get getCashOutCardColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFf57a00) : const Color(0xFFFFCB66);

  static Color get getGreyColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFF6f7275) : const Color(0xFFA0A4A8);

  static Color get getLightGray => Get.find<ThemeCubit>().isDarkMode ? const Color(0x00dbdbdb) : const Color(0xFFF3F3F3);

  static Color get getSupportScreenTextColor => Get.find<ThemeCubit>().isDarkMode ? const Color(0xFFe6e6e6) : const Color(0xFF484848);
}

