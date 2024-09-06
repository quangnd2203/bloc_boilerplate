import '../../core/constants/app_locale.dart';

abstract class ILanguageUseCase{
  void update(AppLocale locale);
  Future<AppLocale?> get();
}
