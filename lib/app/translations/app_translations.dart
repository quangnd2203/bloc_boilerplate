
import 'package:flutter/material.dart';
import '../constants/app_values.dart';

part 'en_us_translations.dart';
part 'vi_vn_translation.dart';
part 'app_translation_delegate.dart';
part 'app_translation_imp.dart';

abstract class AppTranslation {

  static Map<Locale, Map<String, String>> translations = <Locale, Map<String, String>>{
    AppLocale.en.value: enUs,
    AppLocale.vi.value: viVN,
  };

  static Locale localeResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale != null) {
      for (final Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }
      }
    }
    return supportedLocales.first;
  }

  static Iterable<Locale> supportedLocales = AppLocale.values.map((AppLocale e) => e.value);

  static AppTranslation? of(BuildContext context) {
    return Localizations.of<AppTranslation>(context, _AppTranslationImp);
  }

  static const LocalizationsDelegate<AppTranslation> delegate = _AppTranslationDelegate();

  Future<bool> load();

  String translate(String key);

}


