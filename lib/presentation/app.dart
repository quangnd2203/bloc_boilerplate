// ignore_for_file: strict_raw_type, always_specify_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart' as getx;
import 'package:flutter_app/shared/constants/app_colors.dart';
import 'package:flutter_app/shared/constants/app_locale.dart';
import 'package:flutter_app/shared/constants/app_values.dart';
import 'package:flutter_app/application/bloc/language/language_cubit.dart';
import 'package:flutter_app/application/bloc/theme/theme_cubit.dart';
import 'package:flutter_app/domain/interface/service/i_logger_service.dart';
import 'package:flutter_app/presentation/feature/widgets/loading_full_screen.dart';
import 'package:flutter_app/presentation/route/app_pages.dart';
import 'package:flutter_app/presentation/translations/app_translations.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver implements bloc.BlocObserver {
  final ILoggerService loggerService = getx.Get.find<ILoggerService>();


  @override
  void initState() {
    super.initState();
    bloc.Bloc.observer = this;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    loggerService.debug('AppLifecycleState: $state');
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: bloc.MultiBlocListener(
        listeners: <bloc.BlocListener>[
          bloc.BlocListener<LanguageCubit, AppLocale>(
            bloc: getx.Get.find<LanguageCubit>(),
            listener: (BuildContext context, AppLocale state) {
              getx.Get.updateLocale(state.value);
            },
          ),
        ],
        child: bloc.BlocBuilder<ThemeCubit, ThemeState>(
          bloc: getx.Get.find<ThemeCubit>(),
          builder: (BuildContext context, ThemeState state) {
            return getx.GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: (state.mode == ThemeMode.light ? state.lightTheme : state.darkTheme).copyWith(
                scaffoldBackgroundColor: state.mode == ThemeMode.light ? AppColors.themeLightBackgroundColor : AppColors.themeDarkBackgroundColor,
              ),
              title: APP_NAME,
              initialRoute: Routes.SPLASH,
              defaultTransition: getx.Transition.cupertino,
              getPages: AppPages.pages,
              locale: getx.Get.find<LanguageCubit>().state.value,
              translationsKeys: AppTranslation.translations,
              builder: (BuildContext context, Widget? child) {
                return LoadingFullScreen(child: child!);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void onChange(bloc.BlocBase bloc, bloc.Change change) {
    loggerService.debug('onChange: $bloc - $change');
  }

  @override
  void onClose(bloc.BlocBase bloc) {
    loggerService.debug('onClose: $bloc');
  }

  @override
  void onCreate(bloc.BlocBase bloc) {
    loggerService.debug('onCreate: $bloc with ${bloc.state}');
  }

  @override
  void onError(bloc.BlocBase bloc, Object error, StackTrace stackTrace) {
    loggerService.debug('onError: $bloc - $error - $stackTrace');
  }

  @override
  void onEvent(bloc.Bloc bloc, Object? event) {
    loggerService.debug('onEvent: $event');
  }

  @override
  void onTransition(bloc.Bloc bloc, bloc.Transition transition) {
    loggerService.debug('onTransition: $bloc - $transition');
  }
}
