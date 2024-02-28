import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../blocs/language/language_select_state.dart';
import '../extensions/extensions.dart';
import '../routes/app_pages.dart';
import 'app_images.dart';

double get viewPaddingTop => Get.mediaQuery.viewPadding.top;
double get viewPaddingBot => Get.mediaQuery.viewPadding.bottom;
bool get isShowKeyboard => Get.mediaQuery.viewInsets.bottom > 0;

const String APP_NAME = 'ViVi';

/// FLAVOR = dev => development
/// FLAVOR = prod => product
late final String flavor;

enum AppLocale {
  vi(Locale('vi', 'VN')),
  en(Locale('en', 'US'));

  const AppLocale(this._locale);
  final Locale _locale;
  Locale get value => _locale;
}

const int DASH_BOARD_ID = 0;

const double DASHBOARD_NAVIGATION_HEIGHT = 90;

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

final List<LanguageSelectState> appLanguages = <LanguageSelectState>[
  LanguageSelectState(
    imageUrl: AppImages.png('vietnam'),
    languageName: 'Tiếng Việt',
    languageCode: AppLocale.vi.value.languageCode,
    countryCode: AppLocale.vi.value.countryCode,
  ),
  LanguageSelectState(
    imageUrl: AppImages.png('english'),
    languageName: 'English',
    languageCode: AppLocale.en.value.languageCode,
    countryCode: AppLocale.en.value.countryCode,
  ),
];

const int INDEX_NOT_FOUND = -1;

const List<String> AUTHORIZED_ROUTES = <String>[
  Routes.LOGIN,
  Routes.SPLASH,
  Routes.CHANGE_PIN,
];
