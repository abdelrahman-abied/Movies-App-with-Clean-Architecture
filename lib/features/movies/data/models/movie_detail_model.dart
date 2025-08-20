import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel extends Equatable {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final int? voteCount;
  final String? releaseDate;
  final List<GenreModel>? genres;
  final int? runtime;
  final int? budget;
  final int? revenue;
  final List<ProductionCompanyModel>? productionCompanies;
  final String? status;
  final String? tagline;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final bool? video;

  const MovieDetailModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.genres,
    this.runtime,
    this.budget,
    this.revenue,
    this.productionCompanies,
    this.status,
    this.tagline,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.video,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

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
  List<GenreModel> get safeGenres => genres ?? [];
  int get safeRuntime => runtime ?? 0;
  int get safeBudget => budget ?? 0;
  int get safeRevenue => revenue ?? 0;
  List<ProductionCompanyModel> get safeProductionCompanies =>
      productionCompanies ?? [];
  String get safeStatus => status ?? 'Unknown';
  String get safeTagline => tagline ?? '';
  bool get safeAdult => adult ?? false;
  String get safeOriginalLanguage => originalLanguage ?? 'Unknown';
  String get safeOriginalTitle => originalTitle ?? title;
  double get safePopularity => popularity ?? 0.0;
  bool get safeVideo => video ?? false;

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        genres,
        runtime,
        budget,
        revenue,
        productionCompanies,
        status,
        tagline,
        adult,
        originalLanguage,
        originalTitle,
        popularity,
        video,
      ];
}

@JsonSerializable()
class GenreModel extends Equatable {
  final int id;
  final String name;

  const GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}

@JsonSerializable()
class ProductionCompanyModel extends Equatable {
  final int id;
  final String name;
  final String? logoPath;
  final String? originCountry;

  const ProductionCompanyModel({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);

  @override
  List<Object?> get props => [id, name, logoPath, originCountry];
}
