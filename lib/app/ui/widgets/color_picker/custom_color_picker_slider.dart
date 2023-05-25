import 'package:flutter/material.dart';

import 'custom_thumb_color.dart';
import 'custom_track_painter.dart';

class CustomColorPickerSlider extends StatelessWidget {
  const CustomColorPickerSlider(
    this.hsvColor,
    this.onColorChanged, {
    super.key,
  });

  final HSVColor hsvColor;
  final ValueChanged<HSVColor> onColorChanged;

  void slideEvent(RenderBox getBox, BoxConstraints box, Offset globalPosition) {
    final double localDy = getBox.globalToLocal(globalPosition).dy - 15.0;
    final double progress = localDy.clamp(0.0, box.maxHeight - 30.0) / (box.maxHeight - 30.0);
    onColorChanged(hsvColor.withHue(progress * 359));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      double thumbOffset = 15.0;
      thumbOffset += (box.maxHeight - 30) * hsvColor.hue / 360;
      // final Color thumbColor = HSVColor.fromAHSV(1.0, hsvColor.hue, 1.0, 1.0).toColor();
      return CustomMultiChildLayout(
        delegate: _SliderLayout(),
        children: <Widget>[
          LayoutId(
            id: _SliderLayout.track,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: CustomPaint(
                painter: CustomTrackPainter(hsvColor),
              ),
            ),
          ),
          LayoutId(
            id: _SliderLayout.thumb,
            child: Transform.translate(
              offset: Offset(0, thumbOffset),
              child: const CustomPaint(
                painter: CustomThumbPainter(),
              ),
            ),
          ),
          LayoutId(
            id: _SliderLayout.gestureContainer,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints box) {
                final RenderBox? getBox = context.findRenderObject() as RenderBox?;
                return GestureDetector(
                  onPanDown: (DragDownDetails details) => getBox != null ? slideEvent(getBox, box, details.globalPosition) : null,
                  onPanUpdate: (DragUpdateDetails details) => getBox != null ? slideEvent(getBox, box, details.globalPosition) : null,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

class _SliderLayout extends MultiChildLayoutDelegate {
  static const String track = 'track';
  static const String thumb = 'thumb';
  static const String gestureContainer = 'gesturecontainer';

  @override
  void performLayout(Size size) {
    layoutChild(
      track,
      BoxConstraints.tightFor(
        width: size.width,
        height: size.height,
      ),
    );
    positionChild(track, Offset.zero);
    layoutChild(
      thumb,
      BoxConstraints.tightFor(width: size.width, height: size.height),
    );
    positionChild(thumb, Offset(-size.width / 2, -size.height));
    layoutChild(
      gestureContainer,
      BoxConstraints.tightFor(
        width: size.width,
        height: size.height,
      ),
    );
    positionChild(gestureContainer, Offset.zero);
  }

  @override
  bool shouldRelayout(_SliderLayout oldDelegate) => false;
}
