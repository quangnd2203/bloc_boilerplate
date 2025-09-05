import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String input) {
    final StringBuffer buffer = StringBuffer();
    late String hexStringColor = input;
    double opacity = 1;
    if (input.length == 8 || input.length == 9) {
      hexStringColor = input.replaceRange(input.length - 2, input.length, '');
      opacity = int.parse(
              '${input[input.length - 2]}${input[input.length - 1]}',
              radix: 16) /
          255;
    }
    buffer.write('ff');
    buffer.write(hexStringColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16))
        .withValues(alpha: opacity);
  }

  String toHex() {
    final int alpha = (a * 255).round() & 0xff;
    final int red = (r * 255).round() & 0xff;
    final int green = (g * 255).round() & 0xff;
    final int blue = (b * 255).round() & 0xff;
    return '#'
            '${alpha.toRadixString(16).padLeft(2, '0')}'
            '${red.toRadixString(16).padLeft(2, '0')}'
            '${green.toRadixString(16).padLeft(2, '0')}'
            '${blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
