import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    String? overview,
    String? posterPath,
    String? backdropPath,
    double? voteAverage,
    int? voteCount,
    String? releaseDate,
    List<int>? genreIds,
    bool? adult,
    String? originalLanguage,
    String? originalTitle,
    double? popularity,
    bool? video,
  }) = _Movie;

  const Movie._();

  String get fullPosterPath {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return '';
  }

  String get fullBackdropPath {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/t/p/original$backdropPath';
    }
    return '';
  }

  // Getters with default values for nullable fields
  String get safeOverview => overview ?? 'No overview available';
  double get safeVoteAverage => voteAverage ?? 0.0;
  int get safeVoteCount => voteCount ?? 0;
  String get safeReleaseDate => releaseDate ?? 'Release date unknown';
  List<int> get safeGenreIds => genreIds ?? [];
  bool get safeAdult => adult ?? false;
  String get safeOriginalLanguage => originalLanguage ?? 'Unknown';
  String get safeOriginalTitle => originalTitle ?? title;
  double get safePopularity => popularity ?? 0.0;
  bool get safeVideo => video ?? false;
}
