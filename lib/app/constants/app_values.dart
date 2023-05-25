import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extensions/extensions.dart';
import 'app_endpoint.dart';

double get viewPaddingTop => Get.mediaQuery.viewPadding.top;
bool get isShowKeyboard => Get.mediaQuery.viewInsets.bottom > 0;

const String APP_NAME = 'GetX Boilerplate';

/// FLAVOR = dev => development
/// FLAVOR = prod => product
const String FLAVOR = String.fromEnvironment('FLAVOR');

enum AppLocale {
  vi(Locale('vi', 'VN')),
  en(Locale('en', 'US')),
  ja(Locale('ja', 'JP'));

  const AppLocale(this._locale);
  final Locale _locale;
  Locale get value => _locale;
}

const int DASH_BOARD_ID = 0;

const double DASHBOARD_NAVIGATION_HEIGHT = 90;

const List<String> AUTHORIZED_ROUTES = <String>[
  // AppEndpoint.SIGN_IN,
  // AppEndpoint.AUTHENTICATION,
  // AppEndpoint.LOGOUT,
];

final List<Color> availablePickerColors = <Color>[
  HexColor.fromHex('#FBEDA8'),
  HexColor.fromHex('#DCE8AE'),
  HexColor.fromHex('#9EDAC0'),
  HexColor.fromHex('#A1DFD7'),
  HexColor.fromHex('#9CCFDD'),
  HexColor.fromHex('#A6BBDC'),
  HexColor.fromHex('#B9BDD7'),
  HexColor.fromHex('#E5D9ED'),
  HexColor.fromHex('#EDBDD8'),
  HexColor.fromHex('#F1C3C9'),
  HexColor.fromHex('#EDB1B9'),
  HexColor.fromHex('#EABCAB'),
];


