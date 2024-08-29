import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  static Color get themeLightBackgroundColor => const Color(0xFFFAFAFA);

  static Color get themeDarkBackgroundColor => const Color(0xFF343636);

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
}

