// ignore_for_file: no_default_cases

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'custom_hsv_with_hue_color_painter.dart';

class CustomColorPickerArea extends StatelessWidget {
  const CustomColorPickerArea(
    this.hsvColor,
    this.onColorChanged, {
    super.key,
  });

  final HSVColor hsvColor;
  final ValueChanged<HSVColor> onColorChanged;

  void _handleColorRectChange(double horizontal, double vertical) {
    onColorChanged(hsvColor.withSaturation(horizontal).withValue(vertical));
  }

  void _handleGesture(Offset position, BuildContext context, double height, double width) {
    final RenderBox? getBox = context.findRenderObject() as RenderBox?;
    if (getBox == null) {
      return;
    }

    final Offset localOffset = getBox.globalToLocal(position);
    final double horizontal = localOffset.dx.clamp(0.0, width);
    final double vertical = localOffset.dy.clamp(0.0, height);
    _handleColorRectChange(horizontal / width, 1 - vertical / height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return RawGestureDetector(
          gestures: <Type, GestureRecognizerFactory>{
            _AlwaysWinPanGestureRecognizer: GestureRecognizerFactoryWithHandlers<_AlwaysWinPanGestureRecognizer>(
              () => _AlwaysWinPanGestureRecognizer(),
              (_AlwaysWinPanGestureRecognizer instance) {
                instance
                  ..onDown = ((DragDownDetails details) => _handleGesture(details.globalPosition, context, height, width))
                  ..onUpdate = ((DragUpdateDetails details) => _handleGesture(details.globalPosition, context, height, width));
              },
            ),
          },
          child: Builder(
            builder: (BuildContext _) {
              return CustomPaint(painter: CustomHSVWithHueColorPainter(hsvColor));
            },
          ),
        );
      },
    );
  }
}

class _AlwaysWinPanGestureRecognizer extends PanGestureRecognizer {
  @override
  void addAllowedPointer(PointerDownEvent event) {
    super.addAllowedPointer(event);
    resolve(GestureDisposition.accepted);
  }

  @override
  String get debugDescription => 'alwaysWin';
}
