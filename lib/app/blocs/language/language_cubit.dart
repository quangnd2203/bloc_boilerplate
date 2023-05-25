import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_values.dart';
import '../../utils/app_pref.dart';

class LanguageCubit extends Cubit<AppLocale> {
  LanguageCubit() : super(AppPrefs.appLanguage ?? AppLocale.en);

  void changeLanguage(AppLocale state){
    emit(state);
  }
}
