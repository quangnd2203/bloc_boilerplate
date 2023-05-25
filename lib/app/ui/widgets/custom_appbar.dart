import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_values.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, this.backgroundColor = Colors.blue});
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16).copyWith(top: 16 + viewPaddingTop),
      color: backgroundColor,
      child: Text(
        title.tr,
      ),
    );
  }
}
