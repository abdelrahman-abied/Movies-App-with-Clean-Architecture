import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  final bool enableLogging;

  LoggingInterceptor({this.enableLogging = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      print('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
      print('🌐 Headers: ${options.headers}');
      if (options.data != null) {
        print('🌐 Data: ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      print(
          '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('✅ Data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      print(
          '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      print('❌ Message: ${err.message}');
      if (err.response?.data != null) {
        print('❌ Response Data: ${err.response?.data}');
      }
    }
    handler.next(err);
  }
}
