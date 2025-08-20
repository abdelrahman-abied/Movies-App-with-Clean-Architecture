// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseModel _$MovieResponseModelFromJson(Map<String, dynamic> json) =>
    MovieResponseModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieResponseModelToJson(MovieResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
