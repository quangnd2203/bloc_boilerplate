import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../utils/app_utils.dart';

class AppColors {
  AppColors._();

  static Color get primary => AppUtils.valueByMode(values: <Color>[primaryLight, primaryLight]);

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
}
