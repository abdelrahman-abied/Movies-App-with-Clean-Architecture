import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  final bool enableLogging;

  LoggingInterceptor({this.enableLogging = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      debugPrint('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
      debugPrint('🌐 Headers: ${options.headers}');
      if (options.data != null) {
        debugPrint('🌐 Data: ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      debugPrint(
          '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      debugPrint('✅ Data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      debugPrint(
          '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      debugPrint('❌ Message: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('❌ Response Data: ${err.response?.data}');
      }
    }
    handler.next(err);
  }
}
