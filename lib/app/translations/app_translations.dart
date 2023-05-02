// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:ui';

import '../constants/app_values.dart';

part 'en_us_translations.dart';
part 'vi_vn_translation.dart';

abstract class AppTranslation {
  static Map<Locale, Map<String, String>> translations = <Locale, Map<String, String>>{
    AppLocale.en.value: enUs,
    AppLocale.en.value: viVN,
  };
}
