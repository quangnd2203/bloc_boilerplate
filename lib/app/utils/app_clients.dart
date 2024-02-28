// ignore_for_file: avoid_dynamic_calls, always_specify_types, strict_raw_type, invalid_use_of_internal_member, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';
import '../constants/constants.dart';
import 'utils.dart';

class AppClients extends DioForNative {

  AppClients({required String baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: _requestInterceptor,
      onResponse: _responseInterceptor,
      onError: _errorInterceptor,
    ));
    this.options.baseUrl = baseUrl;
    this.options.headers = <String, String>{'content-type': 'application/json', 'accept': 'application/json'};
    // (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String DELETE = 'DELETE';

  static AppClients baseInstance = AppClients(baseUrl: AppEndpoint.BASE_URL);
  static AppClients localServerInstance = AppClients(baseUrl: AppEndpoint.BASE_URL);
  static Logger logger = Logger();

  Future<void> _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = AppPrefs.accessToken;
    options.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    if(flavor == 'dev' || (AppDeviceInfo.isPhysicalDevice ?? false)){
      this.options.headers.addAll({
        'device-id': '${AppDeviceInfo.deviceID}',
        'os': '${AppDeviceInfo.os}',
        'device-model': '${AppDeviceInfo.deviceModel}'
      });
    }
    switch (options.method) {
      case AppClients.GET:
        logger.i('${options.method}: ${options.uri}\nParams: ${options.queryParameters}');
        break;

      default:
        if (options.data is Map<String, dynamic>) {
          logger.i('${options.method}: ${options.uri}\nParams: ${options.data}');
        } else if (options.data is FormData) {
          logger.i('${options.method}: ${options.uri}\nParams: ${options.data.fields}');
        }
        break;
    }
    options.connectTimeout = const Duration(milliseconds: AppEndpoint.connectionTimeout);
    options.receiveTimeout = const Duration(milliseconds: AppEndpoint.receiveTimeout);
    handler.next(options);
  }

  void _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response ${response.requestOptions.uri}: ${response.statusCode}\n Response: ${response.data}');
    handler.next(response);
  }

  void _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    logger.e("${dioError.requestOptions.uri} - ${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic data, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) {
    return request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: DioMixin.checkOptions('GET', options),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }
}
