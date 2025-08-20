import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie_detail.dart';

void main() {
  group('MovieDetail Entity', () {
    const tGenre = Genre(id: 1, name: 'Action');
    const tProductionCompany = ProductionCompany(
      id: 1,
      name: 'Test Studio',
      logoPath: '/test-logo.png',
      originCountry: 'US',
    );

    const tMovieDetail = MovieDetail(
      id: 1,
      title: 'Test Movie Detail',
      overview: 'Test overview',
      posterPath: '/test-poster.jpg',
      backdropPath: '/test-backdrop.jpg',
      voteAverage: 8.5,
      voteCount: 1000,
      releaseDate: '2023-01-01',
      genres: [tGenre],
      runtime: 120,
      budget: 1000000,
      revenue: 5000000,
      productionCompanies: [tProductionCompany],
      status: 'Released',
      tagline: 'Test tagline',
      adult: false,
      originalLanguage: 'en',
      originalTitle: 'Test Movie Detail Original',
      popularity: 100.0,
      video: false,
    );

    const tMinimalMovieDetail = MovieDetail(
      id: 2,
      title: 'Minimal Movie Detail',
    );

    test('should create a MovieDetail with all properties', () {
      expect(tMovieDetail.id, 1);
      expect(tMovieDetail.title, 'Test Movie Detail');
      expect(tMovieDetail.overview, 'Test overview');
      expect(tMovieDetail.posterPath, '/test-poster.jpg');
      expect(tMovieDetail.backdropPath, '/test-backdrop.jpg');
      expect(tMovieDetail.voteAverage, 8.5);
      expect(tMovieDetail.voteCount, 1000);
      expect(tMovieDetail.releaseDate, '2023-01-01');
      expect(tMovieDetail.genres, [tGenre]);
      expect(tMovieDetail.runtime, 120);
      expect(tMovieDetail.budget, 1000000);
      expect(tMovieDetail.revenue, 5000000);
      expect(tMovieDetail.productionCompanies, [tProductionCompany]);
      expect(tMovieDetail.status, 'Released');
      expect(tMovieDetail.tagline, 'Test tagline');
      expect(tMovieDetail.adult, false);
      expect(tMovieDetail.originalLanguage, 'en');
      expect(tMovieDetail.originalTitle, 'Test Movie Detail Original');
      expect(tMovieDetail.popularity, 100.0);
      expect(tMovieDetail.video, false);
    });

    test('should create a MovieDetail with minimal properties', () {
      expect(tMinimalMovieDetail.id, 2);
      expect(tMinimalMovieDetail.title, 'Minimal Movie Detail');
      expect(tMinimalMovieDetail.overview, null);
      expect(tMinimalMovieDetail.posterPath, null);
      expect(tMinimalMovieDetail.backdropPath, null);
      expect(tMinimalMovieDetail.voteAverage, null);
      expect(tMinimalMovieDetail.voteCount, null);
      expect(tMinimalMovieDetail.releaseDate, null);
      expect(tMinimalMovieDetail.genres, null);
      expect(tMinimalMovieDetail.runtime, null);
      expect(tMinimalMovieDetail.budget, null);
      expect(tMinimalMovieDetail.revenue, null);
      expect(tMinimalMovieDetail.productionCompanies, null);
      expect(tMinimalMovieDetail.status, null);
      expect(tMinimalMovieDetail.tagline, null);
      expect(tMinimalMovieDetail.adult, null);
      expect(tMinimalMovieDetail.originalLanguage, null);
      expect(tMinimalMovieDetail.originalTitle, null);
      expect(tMinimalMovieDetail.popularity, null);
      expect(tMinimalMovieDetail.video, null);
    });

    test('should generate full poster path when posterPath is provided', () {
      expect(tMovieDetail.fullPosterPath,
          'https://image.tmdb.org/t/p/w500/test-poster.jpg');
    });

    test('should return empty string when posterPath is null', () {
      expect(tMinimalMovieDetail.fullPosterPath, '');
    });

    test('should generate full backdrop path when backdropPath is provided',
        () {
      expect(tMovieDetail.fullBackdropPath,
          'https://image.tmdb.org/t/p/original/test-backdrop.jpg');
    });

    test('should return empty string when backdropPath is null', () {
      expect(tMinimalMovieDetail.fullBackdropPath, '');
    });

    test('should provide safe values for nullable fields', () {
      expect(tMovieDetail.safeOverview, 'Test overview');
      expect(tMovieDetail.safeVoteAverage, 8.5);
      expect(tMovieDetail.safeVoteCount, 1000);
      expect(tMovieDetail.safeReleaseDate, '2023-01-01');
      expect(tMovieDetail.safeGenres, [tGenre]);
      expect(tMovieDetail.safeRuntime, 120);
      expect(tMovieDetail.safeBudget, 1000000);
      expect(tMovieDetail.safeRevenue, 5000000);
      expect(tMovieDetail.safeProductionCompanies, [tProductionCompany]);
      expect(tMovieDetail.safeStatus, 'Released');
      expect(tMovieDetail.safeTagline, 'Test tagline');
      expect(tMovieDetail.safeAdult, false);
      expect(tMovieDetail.safeOriginalLanguage, 'en');
      expect(tMovieDetail.safeOriginalTitle, 'Test Movie Detail Original');
      expect(tMovieDetail.safePopularity, 100.0);
      expect(tMovieDetail.safeVideo, false);
    });

    test('should provide default values for null fields', () {
      expect(tMinimalMovieDetail.safeOverview, 'No overview available');
      expect(tMinimalMovieDetail.safeVoteAverage, 0.0);
      expect(tMinimalMovieDetail.safeVoteCount, 0);
      expect(tMinimalMovieDetail.safeReleaseDate, 'Release date unknown');
      expect(tMinimalMovieDetail.safeGenres, []);
      expect(tMinimalMovieDetail.safeRuntime, 0);
      expect(tMinimalMovieDetail.safeBudget, 0);
      expect(tMinimalMovieDetail.safeRevenue, 0);
      expect(tMinimalMovieDetail.safeProductionCompanies, []);
      expect(tMinimalMovieDetail.safeStatus, 'Unknown');
      expect(tMinimalMovieDetail.safeTagline, '');
      expect(tMinimalMovieDetail.safeAdult, false);
      expect(tMinimalMovieDetail.safeOriginalLanguage, 'Unknown');
      expect(tMinimalMovieDetail.safeOriginalTitle, 'Minimal Movie Detail');
      expect(tMinimalMovieDetail.safePopularity, 0.0);
      expect(tMinimalMovieDetail.safeVideo, false);
    });

    test('should be equal when all properties are the same', () {
      const tMovieDetail2 = MovieDetail(
        id: 1,
        title: 'Test Movie Detail',
        overview: 'Test overview',
        posterPath: '/test-poster.jpg',
        backdropPath: '/test-backdrop.jpg',
        voteAverage: 8.5,
        voteCount: 1000,
        releaseDate: '2023-01-01',
        genres: [tGenre],
        runtime: 120,
        budget: 1000000,
        revenue: 5000000,
        productionCompanies: [tProductionCompany],
        status: 'Released',
        tagline: 'Test tagline',
        adult: false,
        originalLanguage: 'en',
        originalTitle: 'Test Movie Detail Original',
        popularity: 100.0,
        video: false,
      );

      expect(tMovieDetail, tMovieDetail2);
    });

    test('should not be equal when properties are different', () {
      const tMovieDetail2 = MovieDetail(
        id: 2,
        title: 'Different Movie Detail',
      );

      expect(tMovieDetail, isNot(tMovieDetail2));
    });

    test('should support copyWith', () {
      final updatedMovieDetail = tMovieDetail.copyWith(
        title: 'Updated Title',
        runtime: 150,
      );

      expect(updatedMovieDetail.id, 1);
      expect(updatedMovieDetail.title, 'Updated Title');
      expect(updatedMovieDetail.runtime, 150);
      expect(updatedMovieDetail.overview, 'Test overview'); // unchanged
    });

    test('should support copyWith with null values', () {
      final updatedMovieDetail = tMovieDetail.copyWith(
        overview: null,
        posterPath: null,
      );

      expect(updatedMovieDetail.overview, null);
      expect(updatedMovieDetail.posterPath, null);
      expect(updatedMovieDetail.title, 'Test Movie Detail'); // unchanged
    });
  });

  group('Genre Entity', () {
    const tGenre = Genre(id: 1, name: 'Action');

    test('should create a Genre with required properties', () {
      expect(tGenre.id, 1);
      expect(tGenre.name, 'Action');
    });

    test('should be equal when all properties are the same', () {
      const tGenre2 = Genre(id: 1, name: 'Action');
      expect(tGenre, tGenre2);
    });

    test('should not be equal when properties are different', () {
      const tGenre2 = Genre(id: 2, name: 'Drama');
      expect(tGenre, isNot(tGenre2));
    });

    test('should support copyWith', () {
      final updatedGenre = tGenre.copyWith(name: 'Comedy');
      expect(updatedGenre.id, 1);
      expect(updatedGenre.name, 'Comedy');
    });
  });

  group('ProductionCompany Entity', () {
    const tProductionCompany = ProductionCompany(
      id: 1,
      name: 'Test Studio',
      logoPath: '/test-logo.png',
      originCountry: 'US',
    );

    test('should create a ProductionCompany with all properties', () {
      expect(tProductionCompany.id, 1);
      expect(tProductionCompany.name, 'Test Studio');
      expect(tProductionCompany.logoPath, '/test-logo.png');
      expect(tProductionCompany.originCountry, 'US');
    });

    test('should create a ProductionCompany with minimal properties', () {
      const tMinimalProductionCompany = ProductionCompany(
        id: 2,
        name: 'Minimal Studio',
      );

      expect(tMinimalProductionCompany.id, 2);
      expect(tMinimalProductionCompany.name, 'Minimal Studio');
      expect(tMinimalProductionCompany.logoPath, null);
      expect(tMinimalProductionCompany.originCountry, null);
    });

    test('should be equal when all properties are the same', () {
      const tProductionCompany2 = ProductionCompany(
        id: 1,
        name: 'Test Studio',
        logoPath: '/test-logo.png',
        originCountry: 'US',
      );
      expect(tProductionCompany, tProductionCompany2);
    });

    test('should not be equal when properties are different', () {
      const tProductionCompany2 = ProductionCompany(
        id: 2,
        name: 'Different Studio',
      );
      expect(tProductionCompany, isNot(tProductionCompany2));
    });

    test('should support copyWith', () {
      final updatedProductionCompany = tProductionCompany.copyWith(
        name: 'Updated Studio',
        originCountry: 'UK',
      );
      expect(updatedProductionCompany.id, 1);
      expect(updatedProductionCompany.name, 'Updated Studio');
      expect(updatedProductionCompany.originCountry, 'UK');
      expect(updatedProductionCompany.logoPath, '/test-logo.png'); // unchanged
    });

    test('should support copyWith with null values', () {
      final updatedProductionCompany = tProductionCompany.copyWith(
        logoPath: null,
        originCountry: null,
      );
      expect(updatedProductionCompany.logoPath, null);
      expect(updatedProductionCompany.originCountry, null);
      expect(updatedProductionCompany.name, 'Test Studio'); // unchanged
    });
  });
}
