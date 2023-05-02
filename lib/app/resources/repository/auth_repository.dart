part of 'repository.dart';

class AuthRepository extends BaseRepository {
  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }

  AuthRepository._();

  static AuthRepository? _instance;

// /Example
  Future<NetworkState<List<dynamic>>> testApi() async {
    return callApi<List<dynamic>>(() async {
      const String api = AppEndpoint.TEST_API;
      final Response<List<dynamic>> response = await AppClients().get(api);
      return NetworkState<List<dynamic>>(
        status: AppEndpoint.SUCCESS,
        data: response.data,
      );
    });


    // final bool isDisconnect = await WifiService.isDisconnect();
    // if (isDisconnect) {
    //   return NetworkState<List<dynamic>>.withDisconnect();
    // }
    // try {
    //   const String api = AppEndpoint.TEST_API;
    //   // Map<String, dynamic> params = {
    //   //   "os": Platform.isAndroid ? "android" : "ios"
    //   // };
    //   final Response<List<dynamic>> response = await AppClients().get(api);
    //   return NetworkState<List<dynamic>>(
    //     status: AppEndpoint.SUCCESS,
    //     data: response.data,
    //     // data: response.data?.map((dynamic e) => TestModel.fromJson(e as Map<String, dynamic>)).toList(),
    //   );
    // } on DioError catch (e) {
    //   return NetworkState<List<dynamic>>.withError(e);
    // }
  }
}
