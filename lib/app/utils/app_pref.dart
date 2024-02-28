// ignore_for_file: always_specify_types, strict_raw_type
import 'package:get_storage/get_storage.dart';

import '../blocs/language/language_select_state.dart';

class AppPrefs {
  AppPrefs._();

  static final GetStorage _box = GetStorage('AppPref');

  static Future<void> initListener() async {
    await GetStorage.init('AppPref');
  }

  static set accessToken(String? data) => _box.write('accessToken', data);

  static String? get accessToken => _box.read('accessToken');

  // static set userInfo(UserModel? data) => _box.write('userInfo', data?.toJson());
  //
  // static UserModel? get userInfo => _box.read('userInfo') != null ? UserModel.fromJson(_box.read('userInfo')) : null;

  static set appLanguage(LanguageSelectState? data) => _box.write('appLanguage', data?.toJson());

  static LanguageSelectState? get appLanguage => _box.read('appLanguage') != null ? LanguageSelectState.fromJson(_box.read('appLanguage')) : null;

  static set themeMode(String? data) => _box.write('themeMode', data);

  static String? get themeMode => _box.read('themeMode');

}
