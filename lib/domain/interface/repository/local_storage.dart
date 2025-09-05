abstract class ILocalStorageRepository{
  Future<T> saveData<T>(String key, T data);
  Future<T?> getData<T>(String key);
  Future<bool> removeData(String key);
}
