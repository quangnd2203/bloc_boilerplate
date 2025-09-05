import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/application/usecase/language/language_get_usecase.dart';
import 'package:flutter_app/application/usecase/language/language_update_usecase.dart';

class LanguageCubit extends Cubit<AppLocale>{
  LanguageCubit() : super(AppLocale.en) {
    _languageGetUseCase.execute().then((AppLocale? value) {
      if (value != null) {
        emit(value);
      }
    });
  }

  final LanguageGetUseCase _languageGetUseCase = Get.find<LanguageGetUseCase>();
  final LanguageUpdateUseCase _languageUpdateUseCase = Get.find<LanguageUpdateUseCase>();

  void changeLanguage(AppLocale locale) {
    if (state != locale) {
      emit(locale);
      _languageUpdateUseCase.execute(locale);
    }
  }
}
