import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class NetworkInfo {
  Future<Either<Failure, bool>> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<Either<Failure, bool>> get isConnected async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      final isConnected = connectivityResult != ConnectivityResult.none;
      
      if (isConnected) {
        return const Right(true);
      } else {
        return const Left(NoInternetFailure('No internet connection'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to check network connectivity: $e'));
    }
  }
}
