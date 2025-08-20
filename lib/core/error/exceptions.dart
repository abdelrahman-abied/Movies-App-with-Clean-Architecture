import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  List<Object?> get props => [message, code];
}

class ServerException extends AppException {
  const ServerException(super.message, [super.code]);
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);
}

class CacheException extends AppException {
  const CacheException(super.message, [super.code]);
}

class GeneralException extends AppException {
  const GeneralException(super.message, [super.code]);
}

class NoInternetException extends AppException {
  const NoInternetException(super.message, [super.code]);
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, [super.code]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message, [super.code]);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message, [super.code]);
}

class ValidationException extends AppException {
  const ValidationException(super.message, [super.code]);
}
