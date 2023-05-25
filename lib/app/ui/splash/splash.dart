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
              onTap: () => Get.find<ThemeCubit>().changeTheme(normalTheme().copyWith(scaffoldBackgroundColor: Colors.red)),
              child: Text('red'),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () => Get.find<ThemeCubit>().changeTheme(normalTheme().copyWith(scaffoldBackgroundColor: Colors.white)),
              child: Text('white'),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () => Get.find<ThemeCubit>().changeTheme(normalTheme().copyWith(scaffoldBackgroundColor: Colors.blue)),
              child: Text('blue'),
            ),
          ],
        ),
      ),
    );
  }
}
