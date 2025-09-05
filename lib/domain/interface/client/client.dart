import 'package:dio/dio.dart';

abstract class IClient implements Dio {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String DELETE = 'DELETE';

  Future<void> requestInterceptor(RequestOptions options, RequestInterceptorHandler handler);

  void responseInterceptor(Response<dynamic> response, ResponseInterceptorHandler handler);

  void errorInterceptor(DioException dioError, ErrorInterceptorHandler handler);
}
