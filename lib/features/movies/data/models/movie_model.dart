import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  final int id;
  final String title;
  final String? overview;
  @JsonKey(name: "poster_path" , defaultValue: "")
  final String? posterPath;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  final double? voteAverage;
  final int? voteCount;
  final String? releaseDate;
  final List<int>? genreIds;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final bool? video;

  const MovieModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.genreIds,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.video,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

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
        genreIds,
        adult,
        originalLanguage,
        originalTitle,
        popularity,
        video,
      ];
}
