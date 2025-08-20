// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      releaseDate: json['releaseDate'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      adult: json['adult'] as bool?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'releaseDate': instance.releaseDate,
      'genreIds': instance.genreIds,
      'adult': instance.adult,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'popularity': instance.popularity,
      'video': instance.video,
    };
