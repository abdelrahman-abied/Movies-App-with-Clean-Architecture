import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import 'movie_state.dart';

class MovieNotifier extends StateNotifier<MovieState> {
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;

  MovieNotifier(this._getPopularMovies, this._getTopRatedMovies)
      : super(const MovieInitial());

  Future<void> getPopularMovies({int page = 1, bool refresh = false}) async {
    print('🎬 getPopularMovies called - page: $page, refresh: $refresh');
    print('🎬 Current state: ${state.runtimeType}');

    if (refresh) {
      print('🔄 Refreshing - setting state to loading');
      state = const MovieLoading();
    } else if (state is MovieLoaded && page == 1) {
      print('⏭️ Already loaded first page, skipping');
      return; // Already loaded first page
    }

    if (state is MovieLoaded && !refresh) {
      final currentState = state as MovieLoaded;
      if (currentState.hasReachedMax) {
        print('🏁 Reached max movies, not loading more');
        return;
      }
    }

    try {
      print('🚀 Calling use case with page: $page');
      final result =
          await _getPopularMovies(GetPopularMoviesParams(page: page));
      print('✅ Use case completed, processing result');

      result.fold(
        (failure) {
          print(
              '❌ Failure received: ${failure.runtimeType} - ${failure.message}');
          state = MovieError(
            message: _getErrorMessage(failure),
            code: failure.code,
          );
        },
        (movies) {
          print('🎉 Success! Received ${movies.length} movies');
          if (movies.isEmpty && page == 1) {
            print('📭 No movies found, setting empty state');
            state = const MovieEmpty();
          } else if (movies.isEmpty) {
            print('🏁 No more movies to load');
            // No more movies to load
            if (state is MovieLoaded) {
              final currentState = state as MovieLoaded;
              state = currentState.copyWith(hasReachedMax: true);
            }
          } else {
            if (state is MovieLoaded && !refresh) {
              print('📚 Appending ${movies.length} movies to existing list');
              final currentState = state as MovieLoaded;
              final allMovies = [...currentState.movies, ...movies];
              state = currentState.copyWith(
                movies: allMovies,
                currentPage: page,
                hasReachedMax:
                    movies.length < 20, // Assuming 20 movies per page
              );
            } else {
              print('🆕 Setting new state with ${movies.length} movies');
              state = MovieLoaded(
                movies: movies,
                currentPage: page,
                hasReachedMax: movies.length < 20,
              );
            }
          }
          print('✅ State updated successfully');
        },
      );
    } catch (e, stackTrace) {
      print('💥 Unexpected error in getPopularMovies: $e');
      print('💥 Stack trace: $stackTrace');
      state = MovieError(message: 'Unexpected error: $e');
    }
  }

  Future<void> getTopRatedMovies({int page = 1, bool refresh = false}) async {
    print('🏆 getTopRatedMovies called - page: $page, refresh: $refresh');
    print('🏆 Current state: ${state.runtimeType}');

    if (refresh) {
      print('🔄 Refreshing - setting state to loading');
      state = const MovieLoading();
    } else if (state is MovieLoaded && page == 1) {
      print('⏭️ Already loaded first page, skipping');
      return; // Already loaded first page
    }

    if (state is MovieLoaded && !refresh) {
      final currentState = state as MovieLoaded;
      if (currentState.hasReachedMax) {
        print('🏁 Reached max movies, not loading more');
        return;
      }
    }

    try {
      print('🚀 Calling use case with page: $page');
      final result =
          await _getTopRatedMovies(GetTopRatedMoviesParams(page: page));
      print('✅ Use case completed, processing result');

      result.fold(
        (failure) {
          print(
              '❌ Failure received: ${failure.runtimeType} - ${failure.message}');
          state = MovieError(
            message: _getErrorMessage(failure),
            code: failure.code,
          );
        },
        (movies) {
          print('🎉 Success! Received ${movies.length} movies');
          if (movies.isEmpty && page == 1) {
            print('📭 No movies found, setting empty state');
            state = const MovieEmpty();
          } else if (movies.isEmpty) {
            print('🏁 No more movies to load');
            // No more movies to load
            if (state is MovieLoaded) {
              final currentState = state as MovieLoaded;
              state = currentState.copyWith(hasReachedMax: true);
            }
          } else {
            if (state is MovieLoaded && !refresh) {
              print('📚 Appending ${movies.length} movies to existing list');
              final currentState = state as MovieLoaded;
              final allMovies = [...currentState.movies, ...movies];
              state = currentState.copyWith(
                movies: allMovies,
                currentPage: page,
                hasReachedMax:
                    movies.length < 20, // Assuming 20 movies per page
              );
            } else {
              print('🆕 Setting new state with ${movies.length} movies');
              state = MovieLoaded(
                movies: movies,
                currentPage: page,
                hasReachedMax: movies.length < 20,
              );
            }
          }
          print('✅ State updated successfully');
        },
      );
    } catch (e, stackTrace) {
      print('💥 Unexpected error in getTopRatedMovies: $e');
      print('💥 Stack trace: $stackTrace');
      state = MovieError(message: 'Unexpected error: $e');
    }
  }

  void reset() {
    print('🔄 Resetting state to initial');
    state = const MovieInitial();
  }

  String _getErrorMessage(Failure failure) {
    print('🔍 Getting error message for failure: ${failure.runtimeType}');
    switch (failure.runtimeType) {
      case NoInternetFailure:
        return 'No internet connection';
      case ServerFailure:
        return 'Server error occurred';
      case NetworkFailure:
        return 'Network error';
      case TimeoutFailure:
        return 'Request timeout';
      case UnauthorizedFailure:
        return 'Unauthorized access';
      case NotFoundFailure:
        return 'Resource not found';
      case ValidationFailure:
        return 'Validation error';
      default:
        return failure.message;
    }
  }
}
