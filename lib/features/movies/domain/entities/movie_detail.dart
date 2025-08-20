import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    String? overview,
    String? posterPath,
    String? backdropPath,
    double? voteAverage,
    int? voteCount,
    String? releaseDate,
    List<Genre>? genres,
    int? runtime,
    int? budget,
    int? revenue,
    List<ProductionCompany>? productionCompanies,
    String? status,
    String? tagline,
    bool? adult,
    String? originalLanguage,
    String? originalTitle,
    double? popularity,
    bool? video,
  }) = _MovieDetail;

  const MovieDetail._();

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
  List<Genre> get safeGenres => genres ?? [];
  int get safeRuntime => runtime ?? 0;
  int get safeBudget => budget ?? 0;
  int get safeRevenue => revenue ?? 0;
  List<ProductionCompany> get safeProductionCompanies =>
      productionCompanies ?? [];
  String get safeStatus => status ?? 'Unknown';
  String get safeTagline => tagline ?? '';
  bool get safeAdult => adult ?? false;
  String get safeOriginalLanguage => originalLanguage ?? 'Unknown';
  String get safeOriginalTitle => originalTitle ?? title;
  double get safePopularity => popularity ?? 0.0;
  bool get safeVideo => video ?? false;
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    required String name,
    String? logoPath,
    String? originCountry,
  }) = _ProductionCompany;
}
