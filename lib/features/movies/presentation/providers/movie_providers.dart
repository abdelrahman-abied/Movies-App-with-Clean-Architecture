import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/movie_api_service.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/search_movies.dart';
import '../state/movie_details_notifier.dart';
import '../state/movie_notifier.dart';
import '../state/movie_state.dart';
import '../state/search_movies_notifier.dart';

// API Key - Replace with your actual TMDB API key
const String tmdbApiKey = 'e7079d79292c2a0449a4c141c026ef28';

// Dio provider
final dioProvider = Provider<Dio>((ref) {
  return DioClient.createMovieDio(
    
  );
});

// Connectivity provider
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

// Network info provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImpl(connectivity);
});

// API service provider
final movieApiServiceProvider = Provider<MovieApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieApiService(dio, baseUrl: 'https://api.themoviedb.org/3/');
});

// Repository provider
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final apiService = ref.watch(movieApiServiceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return MovieRepositoryImpl(
    apiService: apiService,
    networkInfo: networkInfo,
    apiKey: tmdbApiKey,
  );
});

// Use case providers
final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetPopularMovies(repository);
});

final getTopRatedMoviesProvider = Provider<GetTopRatedMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetTopRatedMovies(repository);
});

final getMovieDetailsProvider = Provider<GetMovieDetails>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovieDetails(repository);
});

final searchMoviesProvider = Provider<SearchMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SearchMovies(repository);
});

// State notifier providers
final popularMoviesProvider = StateNotifierProvider<MovieNotifier, MovieState>((ref) {
  final getPopularMovies = ref.watch(getPopularMoviesProvider);
  final getTopRatedMovies = ref.watch(getTopRatedMoviesProvider);
  return MovieNotifier(getPopularMovies, getTopRatedMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MovieNotifier, MovieState>((ref) {
  final getPopularMovies = ref.watch(getPopularMoviesProvider);
  final getTopRatedMovies = ref.watch(getTopRatedMoviesProvider);
  return MovieNotifier(getPopularMovies, getTopRatedMovies);
});

// Movie details provider - family provider for individual movie details
final movieDetailsProvider =
    StateNotifierProvider.family<MovieDetailsNotifier, AsyncValue<MovieDetail>, int>((ref, movieId) {
  final getMovieDetails = ref.watch(getMovieDetailsProvider);
  return MovieDetailsNotifier(getMovieDetails);
});

// Search movies provider
final searchMoviesNotifierProvider = StateNotifierProvider<SearchMoviesNotifier, MovieState>((ref) {
  final searchMovies = ref.watch(searchMoviesProvider);
  return SearchMoviesNotifier(searchMovies);
});
