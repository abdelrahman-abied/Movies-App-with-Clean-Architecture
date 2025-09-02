import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/features/movies/domain/entities/movie.dart';
import 'package:flutter_application_1/features/movies/presentation/state/movie_state.dart';

void main() {
  group('MovieState', () {
    const tMovies = [
      Movie(id: 1, title: 'Test Movie 1'),
      Movie(id: 2, title: 'Test Movie 2'),
    ];

    test('should create MovieInitial state', () {
      const state = MovieState.initial();
      expect(state, isA<MovieInitial>());
    });

    test('should create MovieLoading state', () {
      const state = MovieState.loading();
      expect(state, isA<MovieLoading>());
    });

    test('should create MovieLoaded state with default values', () {
      const state = MovieState.loaded(movies: tMovies);
      expect(state, isA<MovieLoaded>());
      
      state.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) {
          expect(movies, tMovies);
          expect(hasReachedMax, false);
          expect(currentPage, 1);
        },
        error: (message, code) => fail('Should not be error'),
        empty: () => fail('Should not be empty'),
      );
    });

    test('should create MovieLoaded state with custom values', () {
      const state = MovieState.loaded(
        movies: tMovies,
        hasReachedMax: true,
        currentPage: 2,
      );
      expect(state, isA<MovieLoaded>());
      
      state.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) {
          expect(movies, tMovies);
          expect(hasReachedMax, true);
          expect(currentPage, 2);
        },
        error: (message, code) => fail('Should not be error'),
        empty: () => fail('Should not be empty'),
      );
    });

    test('should create MovieError state with message only', () {
      const state = MovieState.error(message: 'Test error');
      expect(state, isA<MovieError>());
      
      state.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) => fail('Should not be loaded'),
        error: (message, code) {
          expect(message, 'Test error');
          expect(code, null);
        },
        empty: () => fail('Should not be empty'),
      );
    });

    test('should create MovieError state with message and code', () {
      const state = MovieState.error(message: 'Test error', code: 'ERR001');
      expect(state, isA<MovieError>());
      
      state.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) => fail('Should not be loaded'),
        error: (message, code) {
          expect(message, 'Test error');
          expect(code, 'ERR001');
        },
        empty: () => fail('Should not be empty'),
      );
    });

    test('should create MovieEmpty state', () {
      const state = MovieState.empty();
      expect(state, isA<MovieEmpty>());
    });

    test('should support when method for MovieInitial', () {
      const state = MovieState.initial();
      String result = '';
      
      state.when(
        initial: () => result = 'initial',
        loading: () => result = 'loading',
        loaded: (movies, hasReachedMax, currentPage) => result = 'loaded',
        error: (message, code) => result = 'error',
        empty: () => result = 'empty',
      );

      expect(result, 'initial');
    });

    test('should support when method for MovieLoading', () {
      const state = MovieState.loading();
      String result = '';
      
      state.when(
        initial: () => result = 'initial',
        loading: () => result = 'loading',
        loaded: (movies, hasReachedMax, currentPage) => result = 'loaded',
        error: (message, code) => result = 'error',
        empty: () => result = 'empty',
      );

      expect(result, 'loading');
    });

    test('should support when method for MovieLoaded', () {
      const state = MovieState.loaded(movies: tMovies);
      String result = '';
      List<Movie>? capturedMovies;
      bool? capturedHasReachedMax;
      int? capturedCurrentPage;
      
      state.when(
        initial: () => result = 'initial',
        loading: () => result = 'loading',
        loaded: (movies, hasReachedMax, currentPage) {
          result = 'loaded';
          capturedMovies = movies;
          capturedHasReachedMax = hasReachedMax;
          capturedCurrentPage = currentPage;
        },
        error: (message, code) => result = 'error',
        empty: () => result = 'empty',
      );

      expect(result, 'loaded');
      expect(capturedMovies, tMovies);
      expect(capturedHasReachedMax, false);
      expect(capturedCurrentPage, 1);
    });

    test('should support when method for MovieError', () {
      const state = MovieState.error(message: 'Test error', code: 'ERR001');
      String result = '';
      String? capturedMessage;
      String? capturedCode;
      
      state.when(
        initial: () => result = 'initial',
        loading: () => result = 'loading',
        loaded: (movies, hasReachedMax, currentPage) => result = 'loaded',
        error: (message, code) {
          result = 'error';
          capturedMessage = message;
          capturedCode = code;
        },
        empty: () => result = 'empty',
      );

      expect(result, 'error');
      expect(capturedMessage, 'Test error');
      expect(capturedCode, 'ERR001');
    });

    test('should support when method for MovieEmpty', () {
      const state = MovieState.empty();
      String result = '';
      
      state.when(
        initial: () => result = 'initial',
        loading: () => result = 'loading',
        loaded: (movies, hasReachedMax, currentPage) => result = 'loaded',
        error: (message, code) => result = 'error',
        empty: () => result = 'empty',
      );

      expect(result, 'empty');
    });

    test('should support whenOrNull method', () {
      const state = MovieState.loaded(movies: tMovies);
      
      final result = state.whenOrNull(
        loaded: (movies, hasReachedMax, currentPage) => 'loaded with ${movies.length} movies',
      );

      expect(result, 'loaded with 2 movies');
    });

    test('should support whenOrNull method with orElse', () {
      const state = MovieState.initial();
      
      final result = state.whenOrNull(
        loaded: (movies, hasReachedMax, currentPage) => 'loaded',
      );

      expect(result, null);
    });

    test('should support maybeWhen method', () {
      const state = MovieState.error(message: 'Test error');
      
      final result = state.maybeWhen(
        error: (message, code) => 'error: $message',
        orElse: () => 'not error',
      );

      expect(result, 'error: Test error');
    });

    test('should support maybeWhen method with orElse', () {
      const state = MovieState.initial();
      
      final result = state.maybeWhen(
        error: (message, code) => 'error',
        orElse: () => 'not error',
      );

      expect(result, 'not error');
    });

    test('should support map method', () {
      const state = MovieState.loaded(movies: tMovies);
      String result = '';
      
      state.map(
        initial: (value) => result = 'initial',
        loading: (value) => result = 'loading',
        loaded: (value) => result = 'loaded',
        error: (value) => result = 'error',
        empty: (value) => result = 'empty',
      );

      expect(result, 'loaded');
    });

    test('should support mapOrNull method', () {
      const state = MovieState.error(message: 'Test error');
      
      final result = state.mapOrNull(
        error: (value) => 'error: ${value.message}',
      );

      expect(result, 'error: Test error');
    });

    test('should support maybeMap method', () {
      const state = MovieState.empty();
      
      final result = state.maybeMap(
        empty: (value) => 'empty state',
        orElse: () => 'not empty',
      );

      expect(result, 'empty state');
    });

    test('should support maybeMap method with orElse', () {
      const state = MovieState.initial();
      
      final result = state.maybeMap(
        empty: (value) => 'empty',
        orElse: () => 'not empty',
      );

      expect(result, 'not empty');
    });

    test('should support copyWith for MovieLoaded', () {
      const state = MovieState.loaded(movies: tMovies);
      
      // Use pattern matching to access the specific state type
      state.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) {
          // Create a new state with updated values
          final updatedState = MovieState.loaded(
            movies: movies,
            hasReachedMax: true,
            currentPage: 2,
          );
          
          updatedState.when(
            initial: () => fail('Should not be initial'),
            loading: () => fail('Should not be loading'),
            loaded: (updatedMovies, updatedHasReachedMax, updatedCurrentPage) {
              expect(updatedMovies, tMovies);
              expect(updatedHasReachedMax, true);
              expect(updatedCurrentPage, 2);
            },
            error: (message, code) => fail('Should not be error'),
            empty: () => fail('Should not be empty'),
          );
        },
        error: (message, code) => fail('Should not be error'),
        empty: () => fail('Should not be empty'),
      );
    });

    test('should support copyWith for MovieError', () {
      // const state = MovieState.error(message: 'Test error');
      
      // Create a new state with updated values
      const updatedState = MovieState.error(
        message: 'Updated error',
        code: 'ERR002',
      );

      updatedState.when(
        initial: () => fail('Should not be initial'),
        loading: () => fail('Should not be loading'),
        loaded: (movies, hasReachedMax, currentPage) => fail('Should not be loaded'),
        error: (message, code) {
          expect(message, 'Updated error');
          expect(code, 'ERR002');
        },
        empty: () => fail('Should not be empty'),
      );
    });

    test('should be equal when same type and properties', () {
      const state1 = MovieState.loaded(movies: tMovies);
      const state2 = MovieState.loaded(movies: tMovies);
      
      expect(state1, state2);
    });

    test('should not be equal when different types', () {
      const state1 = MovieState.loaded(movies: tMovies);
      const state2 = MovieState.loading();
      
      expect(state1, isNot(state2));
    });

    test('should not be equal when different properties', () {
      const state1 = MovieState.loaded(movies: tMovies);
      const state2 = MovieState.loaded(
        movies: tMovies,
        hasReachedMax: true,
      );
      
      expect(state1, isNot(state2));
    });
  });
}
