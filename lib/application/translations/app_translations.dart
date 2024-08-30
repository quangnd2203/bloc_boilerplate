// ignore_for_file: avoid_classes_with_only_static_members

import 'en_us_translations.dart';
import 'vi_vn_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = <String, Map<String, String>>{
    'en_US': enUs,
    'vi_VN': viVN,
  };
}
