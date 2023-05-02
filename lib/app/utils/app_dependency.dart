// ignore_for_file: strict_raw_type, avoid_dynamic_calls

import 'package:logger/logger.dart';

class AppDependency {
  AppDependency._();
  static final List<_AppDependenceItem<dynamic>> _data = <_AppDependenceItem<dynamic>>[];

  static T? find<T>({String? tag}) {
    try {
      final T data = _data.firstWhere((_AppDependenceItem<dynamic> e) => e.data.runtimeType == T && e.tag == tag).data as T;
      return data;
    } catch (error) {
      Logger().d('APP DEPENDENCY NOT FOUND TYPE "$T" ${tag != null ? 'WITH TAG "$tag"' : ''}');
    }
    return null;
  }

  static T put<T>(T data, {bool isNotDelete = false, String? tag}) {
    final _AppDependenceItem<T> temp = _AppDependenceItem<T>(data: data, isNotDelete: isNotDelete, tag: tag);
    _data.add(temp);
    Logger().d('APP DEPENDENCY PUT TYPE "$T" ${tag != null ? 'WITH TAG "$tag"' : ''}');
    return temp.data;
  }

  static void delete<T>({String? tag}) {
    _data.removeWhere((_AppDependenceItem<dynamic> e){
      final bool isDeleteSuccess = e.data.runtimeType == T && !e.isNotDelete && e.tag == tag;
      if(isDeleteSuccess){
        Logger().d('APP DEPENDENCY DELETE TYPE "$T" ${tag != null ? 'WITH TAG "$tag"' : ''}');
      }
      return isDeleteSuccess;
    });
  }

  static void deleteAll() {
    _data.clear();
    Logger().d('APP DEPENDENCY DELETE ALL');
  }
}

class _AppDependenceItem<T> {
  const _AppDependenceItem({required this.data, this.isNotDelete = false, this.tag});
  final T data;
  final String? tag;
  final bool isNotDelete;
}
