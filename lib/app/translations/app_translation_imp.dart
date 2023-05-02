part of 'app_translations.dart';

class _AppTranslationImp extends AppTranslation {
  _AppTranslationImp(this.locale);

  final Locale locale;
  late Map<String, String> _localizedStrings;

  @override
  Future<bool> load() async {
    _localizedStrings = AppTranslation.translations[locale]!;
    print(locale);
    print(_localizedStrings);
    print('CCCCCCC');
    return true;
  }

  @override
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
