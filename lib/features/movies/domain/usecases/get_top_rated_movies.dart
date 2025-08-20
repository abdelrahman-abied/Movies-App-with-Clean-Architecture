import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMovies implements UseCase<List<Movie>, GetTopRatedMoviesParams> {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(GetTopRatedMoviesParams params) async {
    return await repository.getTopRatedMovies(params.page);
  }
}

class GetTopRatedMoviesParams extends Equatable {
  final int page;

  const GetTopRatedMoviesParams({required this.page});

  @override
  List<Object?> get props => [page];
}
