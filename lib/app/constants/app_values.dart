
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double get viewPaddingTop => Get.mediaQuery.viewPadding.top;
bool get isShowKeyboard => Get.mediaQuery.viewInsets.bottom > 0;

const String APP_NAME = 'Bloc boilerplate';

/// FLAVOR = dev => development
/// FLAVOR = staging => staging
/// FLAVOR = prod => product
///
const String FLAVOR = String.fromEnvironment('FLAVOR');

enum AppLocale {
  vi(Locale('vi', 'VN')),
  en(Locale('en', 'US'));

  const AppLocale(this._locale);
  final Locale _locale;
  Locale get value => _locale;
}
