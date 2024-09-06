// ignore_for_file: avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  DeviceInfo({this.id, this.version, this.model, this.isPhysicalDevice, this.os});
  String? id;
  String? model;
  String? version;
  bool? isPhysicalDevice;
  String? os;
}

class AppDeviceInfo {
  AppDeviceInfo._();

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static DeviceInfo? _deviceInfo;

  static String? get deviceID => _deviceInfo?.id;

  static String? get deviceModel => _deviceInfo?.model;

  static String? get deviceVersion => _deviceInfo?.version;

  static String? get os => _deviceInfo?.os;

  static bool? get isPhysicalDevice => _deviceInfo?.isPhysicalDevice;

  static bool get isIOS => Platform.isIOS;

  static Future<void> init() async {
    _deviceInfo = await getDeviceDetails();
    print('AppDeviceInfo: $deviceID - $deviceModel - $deviceVersion');
  }

  static Future<DeviceInfo?> getDeviceDetails() async {
    DeviceInfo? device;
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
        device = DeviceInfo(
          model: info.model,
          version: info.version.codename,
          id: info.id,
          isPhysicalDevice: info.isPhysicalDevice,
          os: Platform.operatingSystem,

        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
        device = DeviceInfo(
          model: info.model,
          version: info.systemVersion,
          id: info.identifierForVendor,
          isPhysicalDevice: info.isPhysicalDevice,
          os: Platform.operatingSystem,
        );
        print(info.data);
      }
    } catch (e) {
      print('Failed to get platform version: $e');
    }
    return device;
  }
}
