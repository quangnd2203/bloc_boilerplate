part of 'app_translations.dart';

class _AppTranslationDelegate extends LocalizationsDelegate<_AppTranslationImp> {
  const _AppTranslationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppTranslation.supportedLocales.map((Locale e) => e.languageCode).contains(locale.languageCode);
  }

  @override
  Future<_AppTranslationImp> load(Locale locale) async {
    final _AppTranslationImp localizations = _AppTranslationImp(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppTranslationDelegate old) => false;
}
