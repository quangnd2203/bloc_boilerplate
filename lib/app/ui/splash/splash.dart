import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/language/language_cubit.dart';
import '../../blocs/theme/theme_cubit.dart';
import '../../constants/app_themes.dart';
import '../../constants/app_values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('splash_getting'.tr),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () => Get.find<ThemeCubit>().changeThemeMode(ThemeMode.light),
              child: Text('light'),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () => Get.find<ThemeCubit>().changeThemeMode(ThemeMode.dark),
              child: Text('dark'),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
