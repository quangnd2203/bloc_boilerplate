import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:logger/logger.dart';

import '../../../common/constants/app_endpoint.dart';
import '../../../interface/client/client.dart';

class BrowserClient extends DioForBrowser implements IClient{

  BrowserClient({required String baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: errorInterceptor,
    ));
    this.options.baseUrl = baseUrl;
    this.options.headers = <String, String>{'content-type': 'application/json', 'accept': 'application/json'};
  }

  @override
  final Logger logger = Logger();

  @override
  Future<void> requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    // final String? accessToken = AppPrefs.accessToken;
    const String accessToken = 'access_token';
    options.headers.addAll({
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
        logger.i('${options.method}: ${options.uri}\nParams: ${options.queryParameters}');
        break;

      default:
        if (options.data is Map<String, dynamic>) {
          logger.i('${options.method}: ${options.uri}\nParams: ${options.data}');
        } else if (options.data is FormData) {
          final FormData formData = options.data as FormData;
          logger.i('${options.method}: ${options.uri}\nParams: ${formData.fields}');
        }
        break;
    }
    options.connectTimeout = const Duration(milliseconds: AppEndpoint.connectionTimeout);
    options.receiveTimeout = const Duration(milliseconds: AppEndpoint.receiveTimeout);
    handler.next(options);
  }

  @override
  void errorInterceptor(DioException dioError, ErrorInterceptorHandler handler) {
    logger.e("${dioError.requestOptions.uri} - ${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }

  @override
  void responseInterceptor(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logger.d('Response ${response.requestOptions.uri}: ${response.statusCode}\n Response: ${response.data}');
    handler.next(response);
  }
}
