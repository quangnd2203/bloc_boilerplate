import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../../core/constants/app_endpoint.dart';
import '../../../interface/client/client.dart';
import '../../core/constants/app_pref.dart';
import '../../interface/repository/local_storage.dart';
import '../../interface/service/logger.dart';

class NativeClient extends DioForBrowser implements IClient{

  NativeClient({required String baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: errorInterceptor,
    ));
    this.options.baseUrl = baseUrl;
    this.options.headers = <String, String>{'content-type': 'application/json', 'accept': 'application/json'};
  }

  final ILoggerService loggerService = getx.Get.find<ILoggerService>();

  final ILocalStorageRepository localStorageRepository = getx.Get.find<ILocalStorageRepository>();

  @override
  Future<void> requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = await localStorageRepository.getData(AppPref.ACCESS_TOKEN.name);
    options.headers.addAll(<String, dynamic>{
      'Authorization': 'Bearer $accessToken',
    });
    // if(flavor == 'dev' || (AppDeviceInfo.isPhysicalDevice ?? false)){
    //   this.options.headers.addAll({
    //     'device-id': '${AppDeviceInfo.deviceID}',
    //     'os': '${AppDeviceInfo.os}',
    //     'device-model': '${AppDeviceInfo.deviceModel}'
    //   });
    // }
    switch (options.method) {
      case IClient.GET:
        loggerService.debug('${options.method}: ${options.uri}\nParams: ${options.queryParameters}');
        break;

      default:
        if (options.data is Map<String, dynamic>) {
          loggerService.debug('${options.method}: ${options.uri}\nParams: ${options.data}');
        } else if (options.data is FormData) {
          final FormData formData = options.data as FormData;
          loggerService.debug('${options.method}: ${options.uri}\nParams: ${formData.fields}');
        }
        break;
    }
    options.connectTimeout = const Duration(milliseconds: AppEndpoint.connectionTimeout);
    options.receiveTimeout = const Duration(milliseconds: AppEndpoint.receiveTimeout);
    handler.next(options);
  }

  @override
  void errorInterceptor(DioException dioError, ErrorInterceptorHandler handler) {
    loggerService.debug("${dioError.requestOptions.uri} - ${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }

  @override
  void responseInterceptor(Response<dynamic> response, ResponseInterceptorHandler handler) {
    loggerService.debug('Response ${response.requestOptions.uri}: ${response.statusCode}\n Response: ${response.data}');
    handler.next(response);
  }
}
