import 'package:get/get.dart';

class AppValid {
  AppValid._();

  static String? validationRequired(String? text, {bool hasServerError = false}) {
    if (hasServerError) {
      return 'message_no7_field_invalid'.tr;
    }
    if (text?.isEmpty ?? true) {
      return 'message_no4_field_required'.tr;
    }
    return null;
  }

  static String? validateEmail(String? text, {bool hasServerError = false}) {
    if (hasServerError) {
      return 'message_no1_email_not_exist'.tr;
    }
    if (text?.isEmpty ?? true) {
      return 'message_no4_field_required'.tr;
    } else {
      final RegExp regex = RegExp(r'^\S+@\S+\.\S+$');
      if (!regex.hasMatch(text!))
        return 'message_no2_email_invalid'.tr;
      else
        return null;
    }
  }

  static String? validatePassword(String? text, {bool hasServerError = false}) {
    final RegExp regex = RegExp(r'^[0-9a-zA-Z!@#\$&*~.]+$');
    if (hasServerError) {
      return 'message_no3_password_incorrect'.tr;
    }
    if (text?.isEmpty ?? true) {
      return 'message_no4_field_required'.tr;
    }
    if (!regex.hasMatch(text!)) {
      return 'message_no7_field_invalid'.tr;
    }
    if (text.length > 20) {
      return '20${'please_enter_within_characters'.tr}';
    }
    return null;
  }

  static String? validateConfirmPassword(String? text, String? confirmText) {
    final RegExp regex = RegExp(r'^[0-9a-zA-Z!@#\$&*~.]+$');
    if (text?.isEmpty ?? true) {
      return 'message_no4_field_required'.tr;
    }
    if (!regex.hasMatch(text!)) {
      return 'message_no7_field_invalid'.tr;
    }
    if (text.length > 20) {
      return '20${'please_enter_within_characters'.tr}';
    }
    if (!text.contains(confirmText ?? '')) {
      return 'message_no3_password_incorrect'.tr;
    }
    return null;
  }

  static Function(String) validatePhoneNumber() {
    final RegExp regExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return (String? value) {
      if (value?.isEmpty ?? true) {
        return 'valid_enter_phone'.tr;
      } else if (value!.length != 10) {
        return 'valid_phone'.tr;
      } else if (!regExp.hasMatch(value)) {
        return 'valid_phone'.tr;
      } else {
        return null;
      }
    };
  }
}
