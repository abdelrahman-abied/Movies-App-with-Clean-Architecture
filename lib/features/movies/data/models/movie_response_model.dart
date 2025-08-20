import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'movie_response_model.g.dart';

@JsonSerializable()
class MovieResponseModel extends Equatable {
  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MovieResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseModelToJson(this);

  // Safe getters with default values
  int get safePage => page ?? 1;
  List<MovieModel> get safeResults => results ?? [];
  int get safeTotalPages => totalPages ?? 1;
  int get safeTotalResults => totalResults ?? 0;

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
