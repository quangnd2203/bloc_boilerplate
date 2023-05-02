// ignore_for_file: avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {

  DeviceInfo({this.id, this.version, this.name});
  String? id;
  String? name;
  String? version;
}

class AppDeviceInfo {
  AppDeviceInfo._();

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static DeviceInfo? _deviceInfo;

  static String? get deviceID => _deviceInfo?.id;

  static String? get deviceName => _deviceInfo?.name;

  static String? get deviceVersion => _deviceInfo?.version;

  static Future<void> init() async {
    _deviceInfo = await getDeviceDetails();
    print('AppDeviceInfo: $deviceID - $deviceName - $deviceVersion');
  }

  static Future<DeviceInfo?> getDeviceDetails() async {
    DeviceInfo? device;
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
        device = DeviceInfo(
          name: info.model,
          version: info.version.codename,
          id: info.id,
        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
        device = DeviceInfo(
          name: info.name,
          version: info.systemVersion,
          id: info.identifierForVendor,
        );
      }
    } catch (e) {
      print('Failed to get platform version: $e');
    }
    return device;
  }
}
