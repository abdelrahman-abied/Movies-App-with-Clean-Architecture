import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;
  final List<int> retryStatusCodes;

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
    this.retryStatusCodes = const [408, 500, 502, 503, 504],
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;
    final retryCount = requestOptions.extra['retryCount'] ?? 0;

    // Check if we should retry
    if (_shouldRetry(err, retryCount)) {
      // Increment retry count
      requestOptions.extra['retryCount'] = retryCount + 1;

      // Wait before retrying
      await Future.delayed(retryDelay * (retryCount + 1));

      try {
        // Retry the request
        final dio = Dio();
        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
        return;
      } catch (retryError) {
        // If retry fails, continue with the original error
        handler.next(err);
        return;
      }
    }

    // Don't retry, continue with the original error
    handler.next(err);
  }

  bool _shouldRetry(DioException err, int retryCount) {
    // Don't retry if we've exceeded max retries
    if (retryCount >= maxRetries) {
      return false;
    }

    // Only retry on specific status codes
    if (err.response?.statusCode != null) {
      return retryStatusCodes.contains(err.response!.statusCode);
    }

    // Retry on connection errors
    return err.type == DioExceptionType.connectionError;
  }
}
