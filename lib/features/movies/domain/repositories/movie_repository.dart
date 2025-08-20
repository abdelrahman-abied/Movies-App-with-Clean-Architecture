import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page);
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page);
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page);
  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page);
  Future<Either<Failure, MovieDetail>> getMovieDetails(int movieId);
  Future<Either<Failure, List<Movie>>> searchMovies(String query, int page);
}
