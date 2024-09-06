// ignore_for_file: strict_raw_type, always_specify_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart' as getx;
import '../core/constants/app_colors.dart';
import '../core/constants/app_locale.dart';
import '../core/constants/app_values.dart';
import '../interface/bloc/language/language_cubit.dart';
import '../interface/bloc/theme/theme_cubit.dart';
import '../interface/service/logger.dart';
import 'feature/widgets/loading_full_screen.dart';
import 'route/app_pages.dart';
import 'translations/app_translations.dart';

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
          bloc.BlocListener<ILanguageCubit, AppLocale>(
            bloc: getx.Get.find<ILanguageCubit>(),
            listener: (BuildContext context, AppLocale state) {
              getx.Get.updateLocale(state.value);
            },
          ),
        ],
        child: bloc.BlocBuilder<IThemeCubit, IThemeState>(
          bloc: getx.Get.find<IThemeCubit>(),
          builder: (BuildContext context, IThemeState state) {
            return getx.GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: (state.mode == ThemeMode.light ? state.lightTheme : state.darkTheme).copyWith(
                scaffoldBackgroundColor: state.mode == ThemeMode.light ? AppColors.themeLightBackgroundColor : AppColors.themeDarkBackgroundColor,
              ),
              title: APP_NAME,
              initialRoute: Routes.SPLASH,
              defaultTransition: getx.Transition.cupertino,
              getPages: AppPages.pages,
              locale: getx.Get.find<ILanguageCubit>().state.value,
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
