// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../color_picker/export.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_values.dart';

class ColorPickerDialog extends StatelessWidget {
  ColorPickerDialog({super.key, required this.onChangeColor, this.initColor});
  final ValueChanged<Color> onChangeColor;
  final Color? initColor;

  late Rx<HSVColor> hsvColor = (HSVColor.fromColor(initColor ?? Colors.black).obs)..listen((HSVColor color) {
    onChangeColor(color.toColor());
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.borderLight,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 184,
                  height: 184,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Obx(
                          () => CustomColorPickerArea(
                        hsvColor.value,
                            (HSVColor value) {
                          hsvColor.value = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 184,
                  child: Obx(
                        () => CustomColorPickerSlider(
                      hsvColor.value,
                          (HSVColor value) {
                        hsvColor.value = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomBlockPicker(
              pickerColor: hsvColor.value.toColor(),
              availableColors: availablePickerColors,
              onColorChanged: (Color color) {
                hsvColor.value = HSVColor.fromColor(color);
              },
              itemBuilder: (Color color, bool isCurrentColor, void Function() changeColor) {
                return GestureDetector(
                  onTap: changeColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 32,
                    height: 32,
                  ),
                );
              },
              layoutBuilder: (BuildContext context, List<Color> colors, PickerItem child) {
                return SizedBox(
                  width: Get.width,
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    crossAxisCount: 6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    children: <Widget>[for (Color color in colors) child(color)],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}