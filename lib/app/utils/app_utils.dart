// ignore_for_file: depend_on_referenced_packages, empty_catches, library_prefixes

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../blocs/language/language_cubit.dart';
import '../constants/app_enums.dart';
import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  // static void toast(String message, {int duration = 1}) {
  //   Toast.show(message, duration: duration);
  // }

  // static const List<String> _themes = <String>['dark', 'light'];

  // static T valueByMode<T>({List<String> themes = _themes, required List<T> values}) {
  //   try {
  //     for (int i = 0; i < themes.length; i++) {
  //       if (AppPrefs.appMode == themes[i]) {
  //         if (i < values.length)
  //           return values[i];
  //         else
  //           values.first;
  //       }
  //     }
  //     return values.first;
  //   } catch (e) {
  //     return values.first;
  //   }
  // }

  static String get locale => Get.find<LanguageCubit>().state.locale.languageCode;

  static String pathMediaToUrl(String? url) {
    if (url == null || url.startsWith('http')) {
      return url ?? '';
    }
    return "${"AppEndpoint.BASE_UPLOAD_URL"}$url";
  }

  static String convertDateTime2String(DateTime? dateTime, {String format = 'yy-MM-dd'}) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat(format, locale).format(dateTime);
  }

  static DateTime? convertString2DateTime(String? dateTime, {String format = 'yyyy-MM-ddTHH:mm:ss.SSSZ'}) {
    if (dateTime == null) {
      return null;
    }
    return DateFormat(format, locale).parse(dateTime);
  }

  static String convertString2String(String? dateTime, {String inputFormat = 'yyyy-MM-ddTHH:mm:ss.SSSZ', String outputFormat = 'yyyy-MM-dd'}) {
    if (dateTime == null) {
      return '';
    }
    final DateTime? input = convertString2DateTime(dateTime, format: inputFormat);
    return convertDateTime2String(input, format: outputFormat);
  }

  static String minimum(int? value) {
    if (value == null) {
      return '00';
    }
    return value < 10 ? '0$value' : '$value';
  }

  static String convertPhoneNumber(String phone, {String code = '+84'}) {
    return '$code${phone.substring(1)}';
  }

  static bool isLeapYear(int year) {
    if (year % 100 != 0) {
      return year % 4 == 0;
    } else {
      return year % 400 == 0;
    }
  }

  static bool isMonthHas31Days(int month) {
    return <int>[1, 3, 5, 7, 8, 10, 12].contains(month);
  }

  static bool useWhiteForeground(Color backgroundColor, {double bias = 0.0}) {
    final int v = sqrt(pow(backgroundColor.red, 2) * 0.299 + pow(backgroundColor.green, 2) * 0.587 + pow(backgroundColor.blue, 2) * 0.114).round();
    return v < (130 + bias);
  }

  static Future<Map<Permission, PermissionStatus>> requestPermission(List<Permission> permissions) async {
    return permissions.request();
  }

  static Future<double> getFileSize(String filepath, int decimals, [SizeUnit unit = SizeUnit.MB]) async {
    final File file = File(filepath);
    final int bytes = await file.length();
    return double.parse((bytes / pow(1024, unit.value)).toStringAsFixed(decimals));
  }

  static Future<void> deleteImageNetworkCached() async {
    final Directory tempDir = await getTemporaryDirectory();
    final Directory libCacheDir = Directory('${tempDir.path}/libCachedImageData');
    await libCacheDir.delete(recursive: true);
  }

  // static void logout([bool isReset = true]) {
  // AppPrefs.userInfo = null;
  // AppPrefs.accessToken = null;
  // AppPrefs.userRole = null;
  // if (isReset) {
  //   Get.deleteAll(force: true);
  //   Get.offAllNamed(Routes.SPLASH);
  // }
  // }

  static Future<FileInfo?> getFileFromNetworkCache(String url) async {
    final FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(url);
    return fileInfo;
  }

  static String removeLeadingZero(String phoneNumber) {
    if (phoneNumber.length == 10 && phoneNumber.startsWith('0')) {
      return phoneNumber.substring(1);
    }
    return phoneNumber;
  }

  static String calculateDuration(String input) {
    if (input != null) {
      final DateTime timeBefore = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').parse(input, true);
      final Duration time = DateTime.now().difference(timeBefore);
      if (time.inMinutes < 4) {
        return 'duration_now'.tr;
      } else if (time.inHours < 1) {
        return 'duration_minutes'.trParams(<String, String>{'time': time.inMinutes.toString()});
      } else if (time.inDays < 1) {
        return 'duration_hours'.trParams(<String, String>{'time': time.inHours.toString()});
      } else if (time.inDays < 5) {
        return 'duration_days'.trParams(<String, String>{'time': time.inDays.toString()});
      } else {
        return DateFormat('dd MM yyyy').format(timeBefore);
      }
    }
    return '';
  }

  static String greetingMessage() {
    final int timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'good_morning'.tr;
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'good_afternoon'.tr;
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'good_evening'.tr;
    } else {
      return 'good_night'.tr;
    }
  }

  static dynamic jsonTryParse(String source){
    dynamic data;
    try{
      data = jsonDecode(source);
    }catch(e){
      data = source;
    }
    return data;
  }
}
