import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = MovieInitial;
  const factory MovieState.loading() = MovieLoading;
  const factory MovieState.loaded({
    required List<Movie> movies,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = MovieLoaded;
  const factory MovieState.error({
    required String message,
    String? code,
  }) = MovieError;
  const factory MovieState.empty() = MovieEmpty;
}
