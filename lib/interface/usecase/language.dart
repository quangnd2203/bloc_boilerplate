import '../../core/constants/app_values.dart';

abstract class ILanguageUseCase{
  void update(AppLocale locale);
  Future<AppLocale?> get();
}
