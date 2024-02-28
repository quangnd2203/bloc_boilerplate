// ignore_for_file: always_put_control_body_on_new_line

library flutter_switch;

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../extensions/hex_color.dart';

class SwitchButton extends StatefulWidget {
  /// Creates a material design switch button.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onToggle] is called when the user toggles the switch on or off.
  ///

  const SwitchButton({
    super.key,
    required this.value,
    required this.onToggle,
    this.activeColor,
    this.inactiveColor,
    this.toggleColor = Colors.white,
    this.activeToggleColor,
    this.inactiveToggleColor,
    this.activeToggleWidget,
    this.inactiveToggleWidget,
    this.width = 64.0,
    this.height = 36.0,
    this.padding = 3.0,
    this.toggleSize = 30.0,
    this.borderRadius = 18.0,
    this.duration = const Duration(milliseconds: 200),
    this.disabled = false,
  });

  /// Determines if the switch is on or off.
  ///
  /// This property is required.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  ///
  /// [onToggle] should update the state of the parent [StatefulWidget]
  /// using the [setState] method, so that the parent gets rebuilt; for example:
  ///
  /// ```dart
  /// FlutterSwitch(
  ///   value: _status,
  ///   width: 64,
  ///   borderRadius: 18.0,
  ///   onToggle: (val) {
  ///     setState(() {
  ///        _status = val;
  ///     });
  ///   },
  /// ),
  /// ```
  final ValueChanged<bool> onToggle;

  /// The color to use on the switch when the switch is on.
  final Color? activeColor;

  /// The color to use on the switch when the switch is off.
  final Color? inactiveColor;

  /// The color to use on the toggle of the switch.
  ///
  /// Defaults to [Colors.white].
  final Color toggleColor;

  /// The color to use on the toggle of the switch when the given value is true.
  ///
  /// If [inactiveToggleColor] is used and this property is null. the value of
  /// [Colors.white] will be used.
  final Color? activeToggleColor;

  /// The color to use on the toggle of the switch when the given value is false.
  ///
  /// If [activeToggleColor] is used and this property is null. the value of
  /// [Colors.white] will be used.
  final Color? inactiveToggleColor;

  /// The widget child of Toggle if value is true
  final Widget? activeToggleWidget;

  /// The widget child of Toggle if value is false
  final Widget? inactiveToggleWidget;

  /// The given width of the switch.
  ///
  /// Defaults to a width of 64.0.
  final double width;

  /// The given height of the switch.
  ///
  /// Defaults to a height of 36.0.
  final double height;

  /// The padding of the switch.
  ///
  /// Defaults to the value of 3.0.
  final double padding;

  /// The size of the toggle of the switch.
  ///
  /// Defaults to a size of 30.0.
  final double toggleSize;

  /// The border radius of the switch.
  ///
  /// Defaults to the value of 18.0.
  final double borderRadius;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 200 milliseconds.
  final Duration duration;

  /// Determines whether the switch is disabled.
  ///
  /// Defaults to the value of false.
  final bool disabled;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late final Animation<AlignmentGeometry> _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SwitchButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value)
      _animationController.forward();
    else
      _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color toggleColor = Colors.white;
    Color switchColor = Colors.white;

    if (widget.value) {
      toggleColor = widget.activeToggleColor ?? widget.toggleColor;
      switchColor = widget.activeColor ?? AppColors.bluePrimary;
    } else {
      toggleColor = widget.inactiveToggleColor ?? widget.toggleColor;
      switchColor = widget.inactiveColor ?? HexColor.fromHex('8898A5');
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Align(
          child: GestureDetector(
            onTap: () {
              if (!widget.disabled) {
                if (widget.value)
                  _animationController.forward();
                else
                  _animationController.reverse();

                widget.onToggle(!widget.value);
              }
            },
            child: Opacity(
              opacity: widget.disabled ? 0.6 : 1,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding: EdgeInsets.all(widget.padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: switchColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: _toggleAnimation.value,
                      child: Container(
                        width: widget.toggleSize,
                        height: widget.toggleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: toggleColor,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: AnimatedOpacity(
                                opacity: widget.value ? 1.0 : 0.0,
                                duration: widget.duration,
                                child: widget.activeToggleWidget ??
                                    Text(
                                      'ON',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.medium.copyWith(
                                        fontSize: 14,
                                        color: AppColors.bluePrimary,
                                      ),
                                    ),
                              ),
                            ),
                            Center(
                              child: AnimatedOpacity(
                                opacity: !widget.value ? 1.0 : 0.0,
                                duration: widget.duration,
                                child: widget.inactiveToggleWidget ??
                                    Text(
                                      'OFF',
                                      style: AppTextStyles.medium.copyWith(
                                        fontSize: 14,
                                        color: HexColor.fromHex('8898A5'),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
