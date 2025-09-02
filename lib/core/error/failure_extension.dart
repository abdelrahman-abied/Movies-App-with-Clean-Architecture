
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/error/failures.dart';

extension FailureExtension on DioException{
  Failure toFailure() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure('Request timeout');
      case DioExceptionType.badResponse:
        final statusCode = response?.statusCode;
        switch (statusCode) {
          case 401:
            return const UnauthorizedFailure('Unauthorized access');
          case 404:
            return const NotFoundFailure('Resource not found');
          case 500:
          case 502:
          case 503:
          case 504:
            return const ServerFailure('Internal server error');
          default:
            return ServerFailure(
                'Server error: ${response?.statusMessage ?? 'Unknown error'}');
        }
      case DioExceptionType.connectionError:
        return const NetworkFailure('Connection error');
      case DioExceptionType.cancel:
        return const GeneralFailure('Request cancelled');
      default:
        return GeneralFailure('Network error: $message');
    }
  }
}