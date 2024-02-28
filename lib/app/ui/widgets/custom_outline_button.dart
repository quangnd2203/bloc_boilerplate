import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.height = 60,
    required this.title,
    this.action,
    this.width,
    this.textStyle,
    this.radius = 12,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.boxShadow,
  });
  final VoidCallback? action;
  final String title;
  final double? width;
  final double height;
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
          textAlign: TextAlign.center,
          style: textStyle ?? (AppTextStyles.rubikRegular).copyWith(color: textColor ?? Theme.of(context).textTheme.bodyLarge!.color!, fontSize: AppFontSize.fontTextBig)),
    );
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow,
      ),
      child: OutlinedButton(
        onPressed: action,
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: borderColor ?? Theme.of(context).secondaryHeaderColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? Theme.of(context).secondaryHeaderColor),
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
