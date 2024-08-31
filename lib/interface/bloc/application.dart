import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

abstract class IApplicationBloc{
  void setLoading([bool loading = true]);
  void onWifiStatus(ConnectivityResult result);
  Future<bool> showConfirmDialog({String title, String? des, IconData? icon, String? keyCancel, String? keyConfirm});
  Future<void> showNotificationDialog({String title, String? des, IconData? icon});
  Future<T?> showBottomSheet<T>(BuildContext context, WidgetBuilder builder, {bool isDismissible});
  void showSnackBar(String message, {bool isError, bool isIcon});
  void unFocus();
  void focus(BuildContext context, FocusNode node);
}
