// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    MovieDetailModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      releaseDate: json['releaseDate'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: (json['runtime'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      revenue: (json['revenue'] as num?)?.toInt(),
      productionCompanies: (json['productionCompanies'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      adult: json['adult'] as bool?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'releaseDate': instance.releaseDate,
      'genres': instance.genres,
      'runtime': instance.runtime,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'productionCompanies': instance.productionCompanies,
      'status': instance.status,
      'tagline': instance.tagline,
      'adult': instance.adult,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'popularity': instance.popularity,
      'video': instance.video,
    };

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) => GenreModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompanyModel _$ProductionCompanyModelFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoPath: json['logoPath'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyModelToJson(
        ProductionCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoPath': instance.logoPath,
      'originCountry': instance.originCountry,
    };
