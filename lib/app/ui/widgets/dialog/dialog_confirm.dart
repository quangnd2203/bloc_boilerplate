import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../extensions/hex_color.dart';
import '../custom_outline_button.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({super.key, required this.title, required this.keyConfirm, required this.keyCancel});
  final String title;
  final String keyConfirm;
  final String keyCancel;

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
                      title: keyCancel,
                      radius: 12,
                      action: () => Get.back(result: false),
                      backgroundColor: Colors.white,
                      borderColor: AppColors.borderLight,
                      textColor: AppColors.textGrey,
                    ),
                    const Expanded(child: SizedBox()),
                    CustomOutlinedButton(
                      title: keyConfirm,
                      radius: 12,
                      action: () => Get.back(result: true),
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
