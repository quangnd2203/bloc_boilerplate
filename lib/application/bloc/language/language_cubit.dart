import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

<<<<<<< HEAD
import '../../../core/constants/app_locale.dart';
import '../../../interface/bloc/language/language_cubit.dart';
import '../../../interface/usecase/language.dart';

class LanguageCubit extends Cubit<AppLocale> implements ILanguageCubit {
=======
import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/application/usecase/language.dart';

class LanguageCubit extends Cubit<AppLocale>{
>>>>>>> migration
  LanguageCubit() : super(AppLocale.en) {
    languageUseCase.get().then((AppLocale? value) {
      if (value != null) {
        emit(value);
      }
    });
  }

<<<<<<< HEAD
  final ILanguageUseCase languageUseCase = Get.find<ILanguageUseCase>();

  @override
=======
  final LanguageUseCase languageUseCase = Get.find<LanguageUseCase>();

>>>>>>> migration
  void changeLanguage(AppLocale locale) {
    if (state != locale) {
      emit(locale);
      languageUseCase.update(locale);
    }
  }
}
