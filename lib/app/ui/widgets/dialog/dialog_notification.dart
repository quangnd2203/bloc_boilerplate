import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_text_styles.dart';
import '../../../extensions/extensions.dart';
import '../../ui.dart';

class DialogNotification extends StatelessWidget {
  const DialogNotification({super.key, required this.title, required this.keyConfirm});
  final String title;
  final String keyConfirm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.8,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Text(
                  title.tr,
                  style: AppTextStyles.normal,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomOutlinedButton(
                      title: keyConfirm,
                      radius: 24,
                      action: () => Get.back(result: true),
                      width: 200,
                      height: 48,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                          spreadRadius: 0.01,
                          color: HexColor.fromHex('#DAE3EB'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
