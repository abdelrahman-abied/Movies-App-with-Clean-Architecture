import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptors/dio_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

class DioClient {
  static Dio createDio({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    bool enableLogging = true,
    bool enableRetry = true,
    bool enableAuth = false,
    String? Function()? getAccessToken,
    String? Function()? getRefreshToken,
    Future<String?> Function(String refreshToken)? refreshAccessToken,
    VoidCallback? onTokenExpired,
    VoidCallback? onAuthFailed,
  }) {
    final dio = Dio();

    // Base configuration
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }

    dio.options.connectTimeout = connectTimeout ?? const Duration(seconds: 30);
    dio.options.receiveTimeout = receiveTimeout ?? const Duration(seconds: 30);
    dio.options.sendTimeout = sendTimeout ?? const Duration(seconds: 30);

    // Add interceptors in order (last added = first executed)

    // 1. Logging interceptor (first to execute)
    if (enableLogging) {
      dio.interceptors.add(LoggingInterceptor(enableLogging: enableLogging));
    }

    // 2. Retry interceptor
    if (enableRetry) {
      dio.interceptors.add(RetryInterceptor());
    }

    // 3. Auth interceptor (last to execute, first to handle responses)
    if (enableAuth) {
      dio.interceptors.add(AuthInterceptor(
        getAccessToken: getAccessToken,
        getRefreshToken: getRefreshToken,
        refreshAccessToken: refreshAccessToken,
        onTokenExpired: onTokenExpired,
        onAuthFailed: onAuthFailed,
      ));
    }

    return dio;
  }

  static Dio createMovieDio({
    bool enableLogging = true,
    bool enableRetry = true,
  }) {
    return createDio(
      baseUrl: 'https://api.themoviedb.org/3/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      enableLogging: enableLogging,
      enableRetry: enableRetry,
      enableAuth: false, // TMDB doesn't require auth for public endpoints
    );
  }

  static Dio createAuthenticatedDio({
    required String baseUrl,
    required String? Function() getAccessToken,
    required String? Function() getRefreshToken,
    required Future<String?> Function(String refreshToken) refreshAccessToken,
    VoidCallback? onTokenExpired,
    VoidCallback? onAuthFailed,
    bool enableLogging = true,
    bool enableRetry = true,
  }) {
    return createDio(
      baseUrl: baseUrl,
      enableLogging: enableLogging,
      enableRetry: enableRetry,
      enableAuth: true,
      getAccessToken: getAccessToken,
      getRefreshToken: getRefreshToken,
      refreshAccessToken: refreshAccessToken,
      onTokenExpired: onTokenExpired,
      onAuthFailed: onAuthFailed,
    );
  }
}
