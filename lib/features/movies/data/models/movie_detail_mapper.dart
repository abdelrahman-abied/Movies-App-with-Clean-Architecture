import '../../domain/entities/movie_detail.dart';
import 'movie_detail_model.dart';

class MovieDetailMapper {
  static MovieDetail toEntity(MovieDetailModel model) {
    return MovieDetail(
      id: model.id,
      title: model.title,
      overview: model.overview,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      genres:
          model.genres?.map((g) => Genre(id: g.id, name: g.name)).toList() ??
              [],
      runtime: model.runtime,
      budget: model.budget,
      revenue: model.revenue,
      productionCompanies: model.productionCompanies
              ?.map((p) => ProductionCompany(
                    id: p.id,
                    name: p.name,
                    logoPath: p.logoPath,
                    originCountry: p.originCountry,
                  ))
              .toList() ??
          [],
      status: model.status,
      tagline: model.tagline,
      adult: model.adult,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      popularity: model.popularity,
      video: model.video,
    );
  }

  static MovieDetailModel toModel(MovieDetail entity) {
    return MovieDetailModel(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      releaseDate: entity.releaseDate,
      genres: entity.genres
              ?.map((g) => GenreModel(id: g.id, name: g.name))
              .toList() ??
          [],
      runtime: entity.runtime,
      budget: entity.budget,
      revenue: entity.revenue,
      productionCompanies: entity.productionCompanies
              ?.map((p) => ProductionCompanyModel(
                    id: p.id,
                    name: p.name,
                    logoPath: p.logoPath,
                    originCountry: p.originCountry,
                  ))
              .toList() ??
          [],
      status: entity.status,
      tagline: entity.tagline,
      adult: entity.adult,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      popularity: entity.popularity,
      video: entity.video,
    );
  }
}
