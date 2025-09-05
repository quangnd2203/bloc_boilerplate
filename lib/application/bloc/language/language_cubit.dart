import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/application/usecase/language.dart';

class LanguageCubit extends Cubit<AppLocale>{
  LanguageCubit() : super(AppLocale.en) {
    languageUseCase.get().then((AppLocale? value) {
      if (value != null) {
        emit(value);
      }
    });
  }

  final LanguageUseCase languageUseCase = Get.find<LanguageUseCase>();

  void changeLanguage(AppLocale locale) {
    if (state != locale) {
      emit(locale);
      languageUseCase.update(locale);
    }
  }
}
