import 'package:get/get.dart';

import '../../interface/repository/local_storage.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageRepository implements ILocalStorageRepository{

  final GetStorage _box = Get.find<GetStorage>();

  @override
  Future<T?> getData<T>(String key) async {
    return _box.read<T>(key);
  }

  @override
  Future<bool> removeData(String key) async {
    await _box.remove(key);
    return true;
  }

  @override
  Future<T> saveData<T>(String key, T data) async {
    await _box.write(key, data);
    return data;
  }
}