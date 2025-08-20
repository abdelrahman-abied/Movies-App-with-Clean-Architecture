import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_details.dart';

class MovieDetailsNotifier extends StateNotifier<AsyncValue<MovieDetail>> {
  final GetMovieDetails _getMovieDetails;

  MovieDetailsNotifier(this._getMovieDetails)
      : super(const AsyncValue.loading());

  Future<void> getMovieDetails(int movieId) async {
    state = const AsyncValue.loading();

    try {
      final result =
          await _getMovieDetails(GetMovieDetailsParams(movieId: movieId));

      result.fold(
        (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
        (movieDetail) {
          state = AsyncValue.data(movieDetail);
        },
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.loading();
  }
}
