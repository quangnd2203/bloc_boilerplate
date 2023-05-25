import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.height,
    required this.title,
    this.action,
    this.width,
    this.textStyle,
    this.radius = 20,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.boxShadow,
  });
  final Function()? action;
  final String title;
  final double? width;
  final double? height;
  final double radius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final Widget child = Center(
      child: Text(title.tr,
          style: (textStyle ?? AppTextStyles.normalBold)
              .copyWith(color: textColor ?? Colors.white, fontSize: 15)),
    );
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow ??
            <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0.01,
                color: AppColors.shadowLight,
              ),
            ],
      ),
      child: OutlinedButton(
        onPressed: action,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: borderColor ?? AppColors.bluePrimary)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? AppColors.bluePrimary),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
