import '../../domain/entities/movie.dart';
import 'movie_model.dart';

class MovieMapper {
  static Movie toEntity(MovieModel model) {
    return Movie(
      id: model.id,
      title: model.title,
      overview: model.overview,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      genreIds: model.genreIds,
      adult: model.adult,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      popularity: model.popularity,
      video: model.video,
    );
  }

  static MovieModel toModel(Movie entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      releaseDate: entity.releaseDate,
      genreIds: entity.genreIds,
      adult: entity.adult,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      popularity: entity.popularity,
      video: entity.video,
    );
  }
}
