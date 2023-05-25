// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/constants.dart';
import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32).copyWith(top: viewPaddingTop + 64),
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Image.asset(
              AppImages.png('splash_icon'),
              fit: BoxFit.fill,
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose(GetXState<SplashController> state) {}
}
