import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_locale.dart';
import '../../../interface/bloc/language/language_cubit.dart';
import '../../../interface/usecase/language.dart';

class LanguageCubit extends Cubit<AppLocale> implements ILanguageCubit {
  LanguageCubit() : super(AppLocale.en) {
    languageUseCase.get().then((AppLocale? value) {
      if (value != null) {
        emit(value);
      }
    });
  }

  final ILanguageUseCase languageUseCase = Get.find<ILanguageUseCase>();

  @override
  void changeLanguage(AppLocale locale) {
    if (state != locale) {
      emit(locale);
      languageUseCase.update(locale);
    }
  }
}
