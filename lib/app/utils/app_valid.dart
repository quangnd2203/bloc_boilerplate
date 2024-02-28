import 'package:get/get.dart';

class AppValid {
  AppValid._();

  static String? validateFullName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'valid_full_name'.tr;
    }
    return null;
  }

  static String? validateRequired(String? value, {String errorText = 'field_required'}) {
    if (value?.isEmpty ?? true) {
      return errorText.tr;
    }
    return null;
  }

  static String? validateNumericString(String? value, {String? errorText}) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return (errorText ?? 'number_invalid').tr;
    }
    return null;
  }

  static String? validationUrl(String? text){
    final RegExp urlRegex = RegExp(r'^(https?://)([^\s/$.?#].\S*)$');
    if (!urlRegex.hasMatch(text!)) {
      return 'url_invalid'.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if(value?.isNotEmpty ?? false){
      final RegExp regex = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(value!))
        return 'please_provide_valid_email'.tr;
      else
        return null;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value ?? '')) {
      return 'password_invalid'.tr;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, {String? confirmText}) {
    if(value! != confirmText){
      return 'confirm_password_invalid'.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    final RegExp regExp = RegExp(r'^(0[0-9]{9}|[0-9]{9})$');
    if (value?.isEmpty ?? true) {
      return 'valid_enter_phone'.tr;
    } else if (!regExp.hasMatch(value!)) {
      return 'valid_phone'.tr;
    } else {
      return null;
    }
  }
}
