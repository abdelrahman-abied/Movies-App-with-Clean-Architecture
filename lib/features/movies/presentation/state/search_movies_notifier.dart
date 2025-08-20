import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/search_movies.dart';
import 'movie_state.dart';

class SearchMoviesNotifier extends StateNotifier<MovieState> {
  final SearchMovies _searchMovies;

  SearchMoviesNotifier(this._searchMovies) : super(const MovieInitial());

  Future<void> searchMovies(String query,
      {int page = 1, bool refresh = false}) async {
    if (query.trim().isEmpty) {
      state = const MovieInitial();
      return;
    }

    if (refresh) {
      state = const MovieLoading();
    } else if (state is MovieLoaded && page == 1) {
      return; // Already loaded first page
    }

    if (state is MovieLoaded && !refresh) {
      final currentState = state as MovieLoaded;
      if (currentState.hasReachedMax) return;
    }

    try {
      final result =
          await _searchMovies(SearchMoviesParams(query: query, page: page));

      result.fold(
        (failure) {
          state = MovieError(
            message: _getErrorMessage(failure),
            code: failure.code,
          );
        },
        (movies) {
          if (movies.isEmpty && page == 1) {
            state = const MovieEmpty();
          } else if (movies.isEmpty) {
            // No more movies to load
            if (state is MovieLoaded) {
              final currentState = state as MovieLoaded;
              state = currentState.copyWith(hasReachedMax: true);
            }
          } else {
            if (state is MovieLoaded && !refresh) {
              final currentState = state as MovieLoaded;
              final allMovies = [...currentState.movies, ...movies];
              state = currentState.copyWith(
                movies: allMovies,
                currentPage: page,
                hasReachedMax:
                    movies.length < 20, // Assuming 20 movies per page
              );
            } else {
              state = MovieLoaded(
                movies: movies,
                currentPage: page,
                hasReachedMax: movies.length < 20,
              );
            }
          }
        },
      );
    } catch (e) {
      state = MovieError(message: 'Unexpected error: $e');
    }
  }

  void reset() {
    state = const MovieInitial();
  }

  String _getErrorMessage(Failure failure) {
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
