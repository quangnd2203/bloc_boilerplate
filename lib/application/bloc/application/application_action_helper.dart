part of 'application_cubit.dart';

class _ApplicationActionHelper {
  Future<bool?> confirm({String title = 'alert', String? des, IconData? icon, String? keyCancel, String? keyConfirm}) async {
    final bool? _ = await Get.dialog(AppDialog(
      title: title,
      icon: icon ?? Icons.notification_important_outlined,
      description: des ?? '',
      isFailed: true,
      showTwoBtn: true,
      keyCancel: keyCancel,
      keyConfirm: keyConfirm,
    ));
    return _;
  }

  Future<void> notification({String title = 'notification', String? des, IconData? icon}) async {
    return Get.dialog(AppDialog(
      title: title,
      icon: icon ?? Icons.notification_important_outlined,
      description: des ?? '',
      isFailed: true,
    ));
  }

  Future<T?> showBottomSheet<T>(
    BuildContext context,
    WidgetBuilder builder, {
    bool isDismissible = true,
  }) {
    return showMaterialModalBottomSheet<T>(
      context: context,
      builder: builder,
      barrierColor: Colors.black12,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      useRootNavigator: true,
    );
  }

  void showSnackbar(String message, {bool isError = false, bool isIcon = false}) {
    Get
      ..closeCurrentSnackbar()
      ..showSnackbar(
        GetSnackBar(
          message: message.tr,
          duration: const Duration(milliseconds: 1500),
          backgroundColor: isError ? Colors.red : Colors.green,
          icon: isIcon
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    // Get.back();
                  })
              : null,
        ),
      );
  }

  void unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  }

  void focus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }
}
