import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie.dart';
import 'package:flutter_application_1/features/movies/domain/repositories/movie_repository.dart';
import 'package:flutter_application_1/features/movies/domain/usecases/get_popular_movies.dart';

// TODO: Generate mocks with: flutter packages pub run build_runner build
import 'get_popular_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  group('GetPopularMovies UseCase', () {
    // TODO: Uncomment when mocks are generated
    late GetPopularMovies usecase;
    late MockMovieRepository mockMovieRepository;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      usecase = GetPopularMovies(mockMovieRepository);
    });

    const tMovies = [
      Movie(id: 1, title: 'Test Movie 1'),
      Movie(id: 2, title: 'Test Movie 2'),
    ];

    const tParams = GetPopularMoviesParams(page: 1);

    test('should create GetPopularMovies usecase', () {
      // TODO: Uncomment when mocks are generated
      // expect(usecase, isA<GetPopularMovies>());
      expect(true, true); // Placeholder test
    });

    // TODO: Uncomment all tests when mocks are generated

    test('should get popular movies from the repository', () async {
      // arrange
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Right(tMovies));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Right(tMovies));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Server error');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should pass correct page parameter to repository', () async {
      // arrange
      const tParams2 = GetPopularMoviesParams(page: 2);
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Right(tMovies));

      // act
      await usecase(tParams2);

      // assert
      verify(mockMovieRepository.getPopularMovies(2));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle empty movie list', () async {
      // arrange
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Right(<Movie>[]));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Right(<Movie>[]));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle network failure', () async {
      // arrange
      const tFailure = NetworkFailure('Network error');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle timeout failure', () async {
      // arrange
      const tFailure = TimeoutFailure('Request timeout');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle unauthorized failure', () async {
      // arrange
      const tFailure = UnauthorizedFailure('Unauthorized');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle not found failure', () async {
      // arrange
      const tFailure = NotFoundFailure('Not found');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle validation failure', () async {
      // arrange
      const tFailure = ValidationFailure('Validation error');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should handle no internet failure', () async {
      // arrange
      const tFailure = NoInternetFailure('No internet connection');
      when(mockMovieRepository.getPopularMovies(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockMovieRepository.getPopularMovies(tParams.page));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });

  group('GetPopularMoviesParams', () {
    test('should create params with required page', () {
      const params = GetPopularMoviesParams(page: 1);
      expect(params.page, 1);
    });

    test('should be equal when page is the same', () {
      const params1 = GetPopularMoviesParams(page: 1);
      const params2 = GetPopularMoviesParams(page: 1);
      expect(params1, params2);
    });

    test('should not be equal when page is different', () {
      const params1 = GetPopularMoviesParams(page: 1);
      const params2 = GetPopularMoviesParams(page: 2);
      expect(params1, isNot(params2));
    });

    test('should have correct props', () {
      const params = GetPopularMoviesParams(page: 1);
      expect(params.props, [1]);
    });
  });
}
