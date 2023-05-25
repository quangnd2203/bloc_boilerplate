import 'package:flutter/material.dart';

class CustomThumbPainter extends CustomPainter {
  const CustomThumbPainter();

  // @override
  // void paint(Canvas canvas, Size size) {
  //   canvas.drawCircle(
  //       Offset(0.0, size.height * 0.4),
  //       size.height,
  //       Paint()
  //         ..color = Colors.white
  //         ..style = PaintingStyle.fill);
  //   if (thumbColor != null) {
  //     canvas.drawCircle(
  //         Offset(0.0, size.height * 0.4),
  //         size.height * (0.65),
  //         Paint()
  //           ..color = thumbColor!
  //           ..style = PaintingStyle.fill);
  //   }
  // }

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 4;
    const double radius = 10;
    final Paint backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width, size.height), radius, backgroundPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
