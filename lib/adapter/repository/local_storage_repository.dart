import 'package:flutter_app/domain/interface/repository/i_local_storage_repository.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageRepository implements ILocalStorageRepository{

  final GetStorage _box = GetStorage('LocalStorage');

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