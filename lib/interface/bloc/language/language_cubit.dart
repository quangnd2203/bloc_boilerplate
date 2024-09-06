import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_locale.dart';


abstract class ILanguageCubit implements Cubit<AppLocale> {
  void changeLanguage(AppLocale locale);
}
