import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie_detail.dart';

/// Test configuration and common test data for the Movies app
class TestConfig {
  // Common test movies
  static const List<Movie> testMovies = [
    Movie(
      id: 1,
      title: 'Test Movie 1',
      overview: 'This is a test movie overview for testing purposes',
      posterPath: '/test-poster-1.jpg',
      backdropPath: '/test-backdrop-1.jpg',
      voteAverage: 8.5,
      voteCount: 1000,
      releaseDate: '2023-01-01',
      genreIds: [1, 2, 3],
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Test Movie 1 Original',
      popularity: 100.0,
      video: false,
    ),
    Movie(
      id: 2,
      title: 'Test Movie 2',
      overview: 'Another test movie overview for testing',
      posterPath: '/test-poster-2.jpg',
      backdropPath: '/test-backdrop-2.jpg',
      voteAverage: 7.8,
      voteCount: 750,
      releaseDate: '2023-02-01',
      genreIds: [2, 4],
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Test Movie 2 Original',
      popularity: 85.0,
      video: false,
    ),
    Movie(
      id: 3,
      title: 'Test Movie 3',
      overview: 'Third test movie overview',
      posterPath: '/test-poster-3.jpg',
      backdropPath: '/test-backdrop-3.jpg',
      voteAverage: 9.1,
      voteCount: 1500,
      releaseDate: '2023-03-01',
      genreIds: [1, 5],
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Test Movie 3 Original',
      popularity: 120.0,
      video: false,
    ),
  ];

  // Test movie detail
  static const MovieDetail testMovieDetail = MovieDetail(
    id: 1,
    title: 'Test Movie Detail',
    overview: 'This is a detailed overview of the test movie for testing purposes',
    posterPath: '/test-poster-detail.jpg',
    backdropPath: '/test-backdrop-detail.jpg',
    voteAverage: 8.5,
    voteCount: 1000,
    releaseDate: '2023-01-01',
    genres: [
      Genre(id: 1, name: 'Action'),
      Genre(id: 2, name: 'Adventure'),
    ],
    runtime: 120,
    budget: 1000000,
    revenue: 5000000,
    productionCompanies: [
      ProductionCompany(
        id: 1,
        name: 'Test Studio',
        logoPath: '/test-logo.png',
        originCountry: 'US',
      ),
    ],
    status: 'Released',
    tagline: 'Test tagline for testing',
    adult: false,
    originalLanguage: 'en',
    originalTitle: 'Test Movie Detail Original',
    popularity: 100.0,
    video: false,
  );

  // Test failures
  static const ServerFailure testServerFailure = ServerFailure('Test server error');
  static const NetworkFailure testNetworkFailure = NetworkFailure('Test network error');
  static const TimeoutFailure testTimeoutFailure = TimeoutFailure('Test timeout error');
  static const UnauthorizedFailure testUnauthorizedFailure = UnauthorizedFailure('Test unauthorized error');
  static const NotFoundFailure testNotFoundFailure = NotFoundFailure('Test not found error');
  static const ValidationFailure testValidationFailure = ValidationFailure('Test validation error');
  static const NoInternetFailure testNoInternetFailure = NoInternetFailure('Test no internet error');

  // Test parameters
  static const int testPage = 1;
  static const int testMovieId = 1;
  static const String testQuery = 'test query';

  // Test URLs
  static const String testBaseUrl = 'https://api.themoviedb.org/3';
  static const String testImageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String testBackdropBaseUrl = 'https://image.tmdb.org/t/p/original';

  // Test timeouts
  static const Duration testTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 5);
  static const Duration longTimeout = Duration(seconds: 60);

  // Test screen sizes
  static const Size testPhoneSize = Size(375, 812); // iPhone X
  static const Size testTabletSize = Size(768, 1024); // iPad
  static const Size testDesktopSize = Size(1920, 1080); // Desktop

  /// Helper method to create a test movie with custom properties
  static Movie createTestMovie({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    double? voteAverage,
    List<int>? genreIds,
  }) {
    return Movie(
      id: id ?? 999,
      title: title ?? 'Custom Test Movie',
      overview: overview ?? 'Custom test overview',
      posterPath: posterPath ?? '/custom-test-poster.jpg',
      backdropPath: '/custom-test-backdrop.jpg',
      voteAverage: voteAverage ?? 7.0,
      voteCount: 500,
      releaseDate: '2023-01-01',
      genreIds: genreIds ?? [1, 2],
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Custom Test Movie Original',
      popularity: 50.0,
      video: false,
    );
  }

  /// Helper method to create a test failure with custom message
  static Failure createTestFailure(String message, {String? code}) {
    return ServerFailure(message, code);
  }

  /// Helper method to create test movies list with custom count
  static List<Movie> createTestMoviesList(int count) {
    return List.generate(
      count,
      (index) => createTestMovie(
        id: index + 1,
        title: 'Test Movie ${index + 1}',
      ),
    );
  }

  /// Helper method to create test genres list
  static List<Genre> createTestGenresList(int count) {
    return List.generate(
      count,
      (index) => Genre(
        id: index + 1,
        name: 'Test Genre ${index + 1}',
      ),
    );
  }

  /// Helper method to create test production companies list
  static List<ProductionCompany> createTestProductionCompaniesList(int count) {
    return List.generate(
      count,
      (index) => ProductionCompany(
        id: index + 1,
        name: 'Test Studio ${index + 1}',
        logoPath: '/test-logo-${index + 1}.png',
        originCountry: 'US',
      ),
    );
  }
}

/// Test utilities for common testing operations
class TestUtils {
  /// Wait for a specific condition to be true
  static Future<void> waitForCondition(
    bool Function() condition, {
    Duration timeout = const Duration(seconds: 5),
    Duration interval = const Duration(milliseconds: 100),
  }) async {
    final startTime = DateTime.now();
    while (!condition()) {
      if (DateTime.now().difference(startTime) > timeout) {
        throw TimeoutException('Condition not met within timeout', timeout);
      }
      await Future.delayed(interval);
    }
  }

  /// Create a mock response with delay
  static Future<T> mockResponse<T>(
    T data, {
    Duration delay = const Duration(milliseconds: 100),
  }) async {
    await Future.delayed(delay);
    return data;
  }

  /// Create a mock error response with delay
  static Future<T> mockErrorResponse<T>(
    Exception error, {
    Duration delay = const Duration(milliseconds: 100),
  }) async {
    await Future.delayed(delay);
    throw error;
  }
}
