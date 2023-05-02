// ignore_for_file: avoid_dynamic_calls, always_specify_types, strict_raw_type

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';
import '../constants/constants.dart';
import 'utils.dart';

class AppClients extends DioForNative {
  factory AppClients({BaseOptions? options}) {
    _instance ??= AppClients._(baseUrl: AppEnvironment.getBaseUrlByEnvironment());
    if (options != null) {
      _instance!.options = options;
    }
    _instance!.options.baseUrl = AppEnvironment.getBaseUrlByEnvironment();
    // (_instance!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client){
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    return _instance!;
  }

  AppClients._({required String baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: _requestInterceptor,
      onResponse: _responseInterceptor,
      onError: _errorInterceptor,
    ));
    this.options.baseUrl = baseUrl;
    this.options.headers = AppEnvironment.getBaseHeader();
  }
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String DELETE = 'DELETE';

  static AppClients? _instance;
  static Logger logger = Logger();

  Future<void> _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = AppPrefs.accessToken;
    options.headers.addAll({
      'Authorization': 'Bearer Token $accessToken',
    });
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
    logger.i('Response ${response.requestOptions.uri}: ${response.statusCode}\nData: ${response.data}');
    handler.next(response);
  }

  void _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    logger.e("${dioError.requestOptions.uri} - ${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }
}
