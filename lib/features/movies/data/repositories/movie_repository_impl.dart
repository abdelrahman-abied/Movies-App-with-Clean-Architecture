import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/error/failure_extension.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_api_service.dart';
import '../models/movie_detail_mapper.dart';
import '../models/movie_mapper.dart';

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
    return await _getMovies(() => _apiService.getPopularMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page) async {
    return await _getMovies(() => _apiService.getTopRatedMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page) async {
    return await _getMovies(() => _apiService.getNowPlayingMovies(_apiKey, 'en-US', page));
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page) async {
    return await _getMovies(() => _apiService.getUpcomingMovies(_apiKey, 'en-US', page));
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
          debugPrint('🔍 Fetching movie details for ID: $movieId');
          final movieDetailModel = await _apiService.getMovieDetails(movieId, _apiKey, 'en-US');
          debugPrint('✅ Movie details fetched successfully');
          debugPrint('📊 Movie data: ${movieDetailModel.toJson()}');

          final movieDetail = MovieDetailMapper.toEntity(movieDetailModel);
          debugPrint('🔄 Converted to entity successfully');
          return Right(movieDetail);
        } on DioException catch (e) {
          debugPrint('❌ DioException in getMovieDetails: ${e.message}');
          debugPrint('❌ DioException type: ${e.type}');
          debugPrint('❌ DioException response: ${e.response?.data}');
          return Left(e.toFailure());
        } catch (e, stackTrace) {
          debugPrint('❌ General exception in getMovieDetails: $e');
          debugPrint('❌ Stack trace: $stackTrace');
          return Left(GeneralFailure('Failed to get movie details: $e'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query, int page) async {
    return await _getMovies(() => _apiService.searchMovies(_apiKey, 'en-US', query, page));
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
          debugPrint('🔍 Making API call...');
          final response = await apiCall();
          debugPrint('✅ API call successful');
          debugPrint('📊 Response type: ${response.runtimeType}');
          debugPrint('📊 Response data: ${response.toJson()}');

          if (response.safeResults.isEmpty) {
            debugPrint('📭 No movies found in response');
            return const Right([]);
          }

          debugPrint('📊 Results count: ${response.safeResults.length}');

          final movies = <Movie>[];
          for (int i = 0; i < response.safeResults.length; i++) {
            try {
              final movieModel = response.safeResults[i];
              debugPrint('🔄 Converting movie $i: ${movieModel.title}');
              debugPrint('🔄 Movie model data: ${movieModel.toJson()}');

              final movie = MovieMapper.toEntity(movieModel);
              debugPrint('✅ Movie $i converted successfully');
              movies.add(movie);
            } catch (e, stackTrace) {
              debugPrint('❌ Error converting movie $i: $e');
              debugPrint('❌ Stack trace: $stackTrace');
              debugPrint('❌ Movie data: ${response.safeResults[i]}');
              return Left(GeneralFailure('Failed to convert movie $i: $e'));
            }
          }

          debugPrint('✅ Successfully converted ${movies.length} movies');
          return Right(movies);
        } on DioException catch (exception) {
          debugPrint('❌ DioException in _getMovies: ${exception.message}');
          debugPrint('❌ DioException type: ${exception.type}');
          debugPrint('❌ DioException response: ${exception.response?.data}');
          return Left(exception.toFailure());
        } catch (e, stackTrace) {
          debugPrint('❌ General exception in _getMovies: $e');
          debugPrint('❌ Stack trace: $stackTrace');
          return Left(GeneralFailure('Failed to fetch movies: $e'));
        }
      },
    );
  }
}
