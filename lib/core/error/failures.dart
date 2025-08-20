import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, [this.code]);

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.message, [super.code]);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(super.message, [super.code]);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message, [super.code]);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message, [super.code]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, [super.code]);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.code]);
}
