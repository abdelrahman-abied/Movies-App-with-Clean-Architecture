import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_api_service.dart';
import '../models/movie_mapper.dart';
import '../models/movie_detail_mapper.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _apiService;
  final NetworkInfo _networkInfo;
  final String _apiKey;

  MovieRepositoryImpl({
    required MovieApiService apiService,
    required NetworkInfo networkInfo,
    required String apiKey,
  })  : _apiService = apiService,
        _networkInfo = networkInfo,
        _apiKey = apiKey;

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page) async {
    return await _getMovies(
        () => _apiService.getPopularMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page) async {
    return await _getMovies(
        () => _apiService.getTopRatedMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page) async {
    return await _getMovies(
        () => _apiService.getNowPlayingMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page) async {
    return await _getMovies(
        () => _apiService.getUpcomingMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int movieId) async {
    final networkResult = await _networkInfo.isConnected;

    return networkResult.fold(
      (failure) => Left(failure),
      (isConnected) async {
        if (!isConnected) {
          return const Left(NoInternetFailure('No internet connection'));
        }

        try {
          print('🔍 Fetching movie details for ID: $movieId');
          final movieDetailModel =
              await _apiService.getMovieDetails(movieId, _apiKey, 'en-US');
          print('✅ Movie details fetched successfully');
          print('📊 Movie data: ${movieDetailModel.toJson()}');

          final movieDetail = MovieDetailMapper.toEntity(movieDetailModel);
          print('🔄 Converted to entity successfully');
          return Right(movieDetail);
        } on DioException catch (e) {
          print('❌ DioException in getMovieDetails: ${e.message}');
          print('❌ DioException type: ${e.type}');
          print('❌ DioException response: ${e.response?.data}');
          return Left(_handleDioError(e));
        } catch (e, stackTrace) {
          print('❌ General exception in getMovieDetails: $e');
          print('❌ Stack trace: $stackTrace');
          return Left(GeneralFailure('Failed to get movie details: $e'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(
      String query, int page) async {
    return await _getMovies(
        () => _apiService.searchMovies(_apiKey, 'en-US', query, page));
  }

  Future<Either<Failure, List<Movie>>> _getMovies(
    Future<dynamic> Function() apiCall,
  ) async {
    final networkResult = await _networkInfo.isConnected;

    return networkResult.fold(
      (failure) => Left(failure),
      (isConnected) async {
        if (!isConnected) {
          return const Left(NoInternetFailure('No internet connection'));
        }

        try {
          print('🔍 Making API call...');
          final response = await apiCall();
          print('✅ API call successful');
          print('📊 Response type: ${response.runtimeType}');
          print('📊 Response data: ${response.toJson()}');

          if (response.safeResults.isEmpty) {
            print('📭 No movies found in response');
            return const Right([]);
          }

          print('📊 Results count: ${response.safeResults.length}');

          final movies = <Movie>[];
          for (int i = 0; i < response.safeResults.length; i++) {
            try {
              final movieModel = response.safeResults[i];
              print('🔄 Converting movie $i: ${movieModel.title}');
              print('🔄 Movie model data: ${movieModel.toJson()}');

              final movie = MovieMapper.toEntity(movieModel);
              print('✅ Movie $i converted successfully');
              movies.add(movie);
            } catch (e, stackTrace) {
              print('❌ Error converting movie $i: $e');
              print('❌ Stack trace: $stackTrace');
              print('❌ Movie data: ${response.safeResults[i]}');
              return Left(GeneralFailure('Failed to convert movie $i: $e'));
            }
          }

          print('✅ Successfully converted ${movies.length} movies');
          return Right(movies);
        } on DioException catch (e) {
          print('❌ DioException in _getMovies: ${e.message}');
          print('❌ DioException type: ${e.type}');
          print('❌ DioException response: ${e.response?.data}');
          return Left(_handleDioError(e));
        } catch (e, stackTrace) {
          print('❌ General exception in _getMovies: $e');
          print('❌ Stack trace: $stackTrace');
          return Left(GeneralFailure('Failed to fetch movies: $e'));
        }
      },
    );
  }

  Failure _handleDioError(DioException e) {
    print('🔍 Handling DioException: ${e.type}');
    print('🔍 Status code: ${e.response?.statusCode}');
    print('🔍 Response data: ${e.response?.data}');

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        print('⏰ Timeout error');
        return const TimeoutFailure('Request timeout');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        print('📡 Bad response with status: $statusCode');
        switch (statusCode) {
          case 401:
            print('🔒 Unauthorized error');
            return const UnauthorizedFailure('Unauthorized access');
          case 404:
            print('🔍 Not found error');
            return const NotFoundFailure('Resource not found');
          case 500:
            print('💥 Internal server error');
            return const ServerFailure('Internal server error');
          default:
            print('⚠️ Other server error: $statusCode');
            return ServerFailure(
                'Server error: ${e.response?.statusMessage ?? 'Unknown error'}');
        }
      case DioExceptionType.connectionError:
        print('🌐 Connection error');
        return const NetworkFailure('Connection error');
      case DioExceptionType.cancel:
        print('❌ Request cancelled');
        return const GeneralFailure('Request cancelled');
      default:
        print('❓ Unknown DioException type: ${e.type}');
        return GeneralFailure('Network error: ${e.message}');
    }
  }
}
