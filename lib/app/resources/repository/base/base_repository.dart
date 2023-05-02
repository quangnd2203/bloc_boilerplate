part of '../repository.dart';

typedef CallBackAPI<T> = Future<NetworkState<T>> Function();

abstract class BaseRepository {
  Future<NetworkState<T>> callApi<T>(CallBackAPI<T> apiCallBack,) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<T>.withDisconnect();
    }
    try {
      final NetworkState<T> result = await apiCallBack();
      return result;
    } on DioError catch (e) {
      return NetworkState<T>.withError(e);
    }
  }
}
