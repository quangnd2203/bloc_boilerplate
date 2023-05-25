// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

class CustomTrackPainter extends CustomPainter {
  const CustomTrackPainter(this.hsvColor);

  final HSVColor hsvColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    // if (trackType == TrackType.alpha) {
    //   final Size chessSize = Size(size.height / 2, size.height / 2);
    //   final Paint chessPaintB = Paint()..color = const Color(0xffcccccc);
    //   final Paint chessPaintW = Paint()..color = Colors.white;
    //   List.generate((size.height / chessSize.height).round(), (int y) {
    //     List.generate((size.width / chessSize.width).round(), (int x) {
    //       canvas.drawRect(
    //         Offset(chessSize.width * x, chessSize.width * y) & chessSize,
    //         (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
    //       );
    //     });
    //   });
    // }
    final List<Color> colors = [
      const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 60.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 120.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 180.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 240.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 300.0, 1.0, 1.0).toColor(),
      const HSVColor.fromAHSV(1.0, 360.0, 1.0, 1.0).toColor(),
    ];
    final Gradient gradient = LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter);
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
