import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../error/exceptions.dart';

class AuthInterceptor extends Interceptor {
  final String? Function()? getAccessToken;
  final String? Function()? getRefreshToken;
  final Future<String?> Function(String refreshToken)? refreshAccessToken;
  final VoidCallback? onTokenExpired;
  final VoidCallback? onAuthFailed;

  AuthInterceptor({
    this.getAccessToken,
    this.getRefreshToken,
    this.refreshAccessToken,
    this.onTokenExpired,
    this.onAuthFailed,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add authorization header if token exists
    final token = getAccessToken?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Add common headers
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle successful responses
    handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized errors (token expired)
    if (err.response?.statusCode == 401) {
      try {
        // Try to refresh the token
        final refreshToken = getRefreshToken?.call();
        if (refreshToken != null && refreshToken.isNotEmpty) {
          final newAccessToken = await refreshAccessToken?.call(refreshToken);

          if (newAccessToken != null && newAccessToken.isNotEmpty) {
            // Retry the original request with new token
            final response = await _retryRequest(err.requestOptions, newAccessToken);
            handler.resolve(response);
            return;
          }
        }

        // If refresh failed, notify about token expiration
        onTokenExpired?.call();
        handler.reject(_createCustomException(err, 'Token expired and refresh failed'));
      } catch (refreshError) {
        // If refresh throws an error, notify about auth failure
        onAuthFailed?.call();
        handler.reject(_createCustomException(err, 'Authentication failed'));
      }
      return;
    }

    // Handle other errors
    final customException = _createCustomException(err);
    handler.reject(customException);
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String newAccessToken,
  ) async {
    final dio = Dio();

    // Create new request options with new token
    final newOptions = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newAccessToken',
      },
    );

    // Retry the request
    return await dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: newOptions,
    );
  }

  DioException _createCustomException(DioException err, [String? customMessage]) {
    final message = customMessage ?? _getErrorMessage(err);
    final code = err.response?.statusCode?.toString();

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: TimeoutException(message, code),
        );
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        switch (statusCode) {
          case 400:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: ValidationException(message, code),
            );
          case 401:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: UnauthorizedException(message, code),
            );
          case 403:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: UnauthorizedException(message, code),
            );
          case 404:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: NotFoundException(message, code),
            );
          case 500:
          case 502:
          case 503:
          case 504:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: ServerException(message, code),
            );
          default:
            return DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              type: err.type,
              error: ServerException(message, code),
            );
        }
      case DioExceptionType.connectionError:
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: NetworkException(message, code),
        );
      case DioExceptionType.cancel:
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: GeneralException(message, code),
        );
      default:
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: GeneralException(message, code),
        );
    }
  }

  String _getErrorMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Request timeout';
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final statusMessage = err.response?.statusMessage;
        final data = err.response?.data;

        if (data != null && data is Map<String, dynamic>) {
          // Try to extract error message from response data
          final errorMessage = data['message'] ?? data['error'] ?? data['detail'];
          if (errorMessage != null) {
            return errorMessage.toString();
          }
        }

        return statusMessage ?? 'HTTP Error $statusCode';
      case DioExceptionType.connectionError:
        return 'Connection error';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      default:
        return err.message ?? 'Unknown error occurred';
    }
  }
}
