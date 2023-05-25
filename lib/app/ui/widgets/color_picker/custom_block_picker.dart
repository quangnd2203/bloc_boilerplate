// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
typedef PickerItem = Widget Function(Color color);

typedef PickerLayoutBuilder = Widget Function(BuildContext context, List<Color> colors, PickerItem child);

typedef PickerItemBuilder = Widget Function(Color color, bool isCurrentColor, void Function() changeColor);

class CustomBlockPicker extends StatefulWidget {
  const CustomBlockPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
    required this.availableColors,
    this.useInShowDialog = true,
    required this.layoutBuilder,
    required this.itemBuilder,
  });

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final List<Color> availableColors;
  final bool useInShowDialog;
  final PickerLayoutBuilder layoutBuilder;
  final PickerItemBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() => _CustomBlockPickerState();
}

class _CustomBlockPickerState extends State<CustomBlockPicker> {
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = widget.pickerColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() => _currentColor = color);
    widget.onColorChanged(color);
  }

  @override
  Widget build(BuildContext context) {
    return widget.layoutBuilder(
      context,
      widget.availableColors,
      (Color color) => widget.itemBuilder(
        color,
        (_currentColor.value == color.value) && (widget.useInShowDialog ? true : widget.pickerColor.value == color.value),
        () => changeColor(color),
      ),
    );
  }
}
