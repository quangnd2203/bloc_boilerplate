// ignore_for_file: always_specify_types, strict_raw_type
import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/app_values.dart';

class AppPrefs {
  AppPrefs._();

  static final GetStorage _box = GetStorage('AppPref');

  static final BehaviorSubject<dynamic> _userBehavior = BehaviorSubject<dynamic>();

  static Future<void> initListener() async {
    await GetStorage.init('AppPref');
    _box.listenKey('userInfo', (user) {
      _userBehavior.add(user);
    });
  }

  static set appMode(String? data) => _box.write('appMode', data);

  static String? get appMode => _box.read('appMode');

  static set accessToken(String? data) => _box.write('accessToken', data);

  static String? get accessToken => _box.read('accessToken');

  static set appLanguage(AppLocale? data) => _box.write('appLanguage', data);

  static AppLocale? get appLanguage => _box.read<AppLocale>('appLanguage');

  // static set userInfo(UserResponse? user) {
  //   _box.write('userInfo', user?.toJson());
  // }
  //
  // static UserResponse? get userInfo {
  //   final _ = _box.read('userInfo');
  //   if (_ == null)
  //     return null;
  //   return UserResponse.fromJson(_box.read('userInfo'));
  // }

  static Stream get watchUser => _userBehavior.stream;
}
