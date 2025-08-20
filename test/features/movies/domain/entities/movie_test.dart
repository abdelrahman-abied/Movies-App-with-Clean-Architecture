import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie.dart';

void main() {
  group('Movie Entity', () {
    const tMovie = Movie(
      id: 1,
      title: 'Test Movie',
      overview: 'Test overview',
      posterPath: '/test-poster.jpg',
      backdropPath: '/test-backdrop.jpg',
      voteAverage: 8.5,
      voteCount: 1000,
      releaseDate: '2023-01-01',
      genreIds: [1, 2, 3],
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Test Movie Original',
      popularity: 100.0,
      video: false,
    );

    const tMinimalMovie = Movie(
      id: 2,
      title: 'Minimal Movie',
    );

    test('should create a Movie with all properties', () {
      expect(tMovie.id, 1);
      expect(tMovie.title, 'Test Movie');
      expect(tMovie.overview, 'Test overview');
      expect(tMovie.posterPath, '/test-poster.jpg');
      expect(tMovie.backdropPath, '/test-backdrop.jpg');
      expect(tMovie.voteAverage, 8.5);
      expect(tMovie.voteCount, 1000);
      expect(tMovie.releaseDate, '2023-01-01');
      expect(tMovie.genreIds, [1, 2, 3]);
      expect(tMovie.adult, false);
      expect(tMovie.originalLanguage, 'en');
      expect(tMovie.originalTitle, 'Test Movie Original');
      expect(tMovie.popularity, 100.0);
      expect(tMovie.video, false);
    });

    test('should create a Movie with minimal properties', () {
      expect(tMinimalMovie.id, 2);
      expect(tMinimalMovie.title, 'Minimal Movie');
      expect(tMinimalMovie.overview, null);
      expect(tMinimalMovie.posterPath, null);
      expect(tMinimalMovie.backdropPath, null);
      expect(tMinimalMovie.voteAverage, null);
      expect(tMinimalMovie.voteCount, null);
      expect(tMinimalMovie.releaseDate, null);
      expect(tMinimalMovie.genreIds, null);
      expect(tMinimalMovie.adult, null);
      expect(tMinimalMovie.originalLanguage, null);
      expect(tMinimalMovie.originalTitle, null);
      expect(tMinimalMovie.popularity, null);
      expect(tMinimalMovie.video, null);
    });

    test('should generate full poster path when posterPath is provided', () {
      expect(tMovie.fullPosterPath, 'https://image.tmdb.org/t/p/w500/test-poster.jpg');
    });

    test('should return empty string when posterPath is null', () {
      expect(tMinimalMovie.fullPosterPath, '');
    });

    test('should generate full backdrop path when backdropPath is provided', () {
      expect(tMovie.fullBackdropPath, 'https://image.tmdb.org/t/p/original/test-backdrop.jpg');
    });

    test('should return empty string when backdropPath is null', () {
      expect(tMinimalMovie.fullBackdropPath, '');
    });

    test('should provide safe values for nullable fields', () {
      expect(tMovie.safeOverview, 'Test overview');
      expect(tMovie.safeVoteAverage, 8.5);
      expect(tMovie.safeVoteCount, 1000);
      expect(tMovie.safeReleaseDate, '2023-01-01');
      expect(tMovie.safeGenreIds, [1, 2, 3]);
      expect(tMovie.safeAdult, false);
      expect(tMovie.safeOriginalLanguage, 'en');
      expect(tMovie.safeOriginalTitle, 'Test Movie Original');
      expect(tMovie.safePopularity, 100.0);
      expect(tMovie.safeVideo, false);
    });

    test('should provide default values for null fields', () {
      expect(tMinimalMovie.safeOverview, 'No overview available');
      expect(tMinimalMovie.safeVoteAverage, 0.0);
      expect(tMinimalMovie.safeVoteCount, 0);
      expect(tMinimalMovie.safeReleaseDate, 'Release date unknown');
      expect(tMinimalMovie.safeGenreIds, []);
      expect(tMinimalMovie.safeAdult, false);
      expect(tMinimalMovie.safeOriginalLanguage, 'Unknown');
      expect(tMinimalMovie.safeOriginalTitle, 'Minimal Movie');
      expect(tMinimalMovie.safePopularity, 0.0);
      expect(tMinimalMovie.safeVideo, false);
    });

    test('should be equal when all properties are the same', () {
      const tMovie2 = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        posterPath: '/test-poster.jpg',
        backdropPath: '/test-backdrop.jpg',
        voteAverage: 8.5,
        voteCount: 1000,
        releaseDate: '2023-01-01',
        genreIds: [1, 2, 3],
        adult: false,
        originalLanguage: 'en',
        originalTitle: 'Test Movie Original',
        popularity: 100.0,
        video: false,
      );

      expect(tMovie, tMovie2);
    });

    test('should not be equal when properties are different', () {
      const tMovie2 = Movie(
        id: 2,
        title: 'Different Movie',
      );

      expect(tMovie, isNot(tMovie2));
    });

    test('should support copyWith', () {
      final updatedMovie = tMovie.copyWith(
        title: 'Updated Title',
        voteAverage: 9.0,
      );

      expect(updatedMovie.id, 1);
      expect(updatedMovie.title, 'Updated Title');
      expect(updatedMovie.voteAverage, 9.0);
      expect(updatedMovie.overview, 'Test overview'); // unchanged
    });

    test('should support copyWith with null values', () {
      final updatedMovie = tMovie.copyWith(
        overview: null,
        posterPath: null,
      );

      expect(updatedMovie.overview, null);
      expect(updatedMovie.posterPath, null);
      expect(updatedMovie.title, 'Test Movie'); // unchanged
    });
  });
}
