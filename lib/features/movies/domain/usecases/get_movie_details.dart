import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_detail.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetails implements UseCase<MovieDetail, GetMovieDetailsParams> {
  final MovieRepository repository;

  GetMovieDetails(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> call(GetMovieDetailsParams params) async {
    return await repository.getMovieDetails(params.movieId);
  }
}

class GetMovieDetailsParams {
  final int movieId;

  GetMovieDetailsParams({required this.movieId});
}
