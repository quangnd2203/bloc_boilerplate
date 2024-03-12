import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../extensions/hex_color.dart';

class CustomDropdownController extends ChangeNotifier {
  bool menuIsShowing = false;

  void showMenu() {
    menuIsShowing = true;
    notifyListeners();
  }

  void hideMenu() {
    menuIsShowing = false;
    notifyListeners();
  }

  void toggleMenu() {
    menuIsShowing = !menuIsShowing;
    notifyListeners();
  }
}

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.hint,
    this.controller,
    required this.menuBuilder,
    this.value,
    this.valueBuilder,
    this.isEnabled = true,
  });
  final String hint;
  final CustomDropdownController? controller;
  final Widget Function(BuildContext context) menuBuilder;
  final T? value;
  final Widget Function(BuildContext context, T? value)? valueBuilder;
  final bool isEnabled;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  RenderBox? _childBox;
  OverlayEntry? _overlay;
  final double menuHeight = 250;
  double dyPosition = 0;
  double dxPosition = 0;
  final GlobalKey key = GlobalKey();
  CustomDropdownController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller ??= CustomDropdownController();
    _controller?.addListener(_updateView);
    WidgetsBinding.instance.addPostFrameCallback((Duration call) {
      if (mounted) {
        _childBox = context.findRenderObject() as RenderBox?;
      }
    });
  }

  @override
  void dispose() {
    closeOverlay();
    _controller?.removeListener(_updateView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        closeOverlay();
        return true;
      },
      child: InkWell(
        key: key,
        onTap: () {
          if (widget.isEnabled) {
            showOverlay();
          }
        },
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
              decoration: BoxDecoration(
                color: AppColors.getCardBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  if (widget.value == null)
                    Expanded(
                      child: Text(
                        widget.hint,
                        style: AppTextStyles.rubikMedium.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: widget.valueBuilder!(context, widget.value),
                    ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.arrow_drop_down,
                color: widget.isEnabled ? HexColor.fromHex('#7B7B7B') : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenu({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.getWhiteAndBlack,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 0.001,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      width: _childBox!.size.width,
      constraints: BoxConstraints(
        maxHeight: menuHeight,
      ),
      child: child,
    );
  }

  OverlayEntry buildOverlay() {
    return OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              ModalBarrier(
                onDismiss: () {
                  closeOverlay();
                },
              ),
              Positioned(
                top: dyPosition,
                left: dxPosition,
                child: buildMenu(
                  child: widget.menuBuilder(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showOverlay() {
    findDropdownPosition();
    _overlay = buildOverlay();
    _controller?.menuIsShowing = true;
    Overlay.of(context).insert(_overlay!);
  }

  void closeOverlay() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }

  void _updateView() {
    final bool menuIsShowing = _controller?.menuIsShowing ?? false;
    if (menuIsShowing) {
      showOverlay();
    } else {
      closeOverlay();
    }
  }

  void findDropdownPosition() {
    final RenderBox? renderBox = _childBox;
    final double height = renderBox?.size.height ?? 0;
    final Offset? offset = renderBox?.localToGlobal(Offset.zero);
    final double dx = offset?.dx ?? 0;
    final double dy = offset?.dy ?? 0;
    if (dy + menuHeight > Get.height - 100) {
      dyPosition = dy - menuHeight;
    } else {
      dyPosition = dy + height;
    }
    dxPosition = dx;
  }
}
