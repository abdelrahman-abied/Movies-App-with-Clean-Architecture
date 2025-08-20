import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movie_response_model.dart';
import '../models/movie_detail_model.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET("movie/popular")
  Future<MovieResponseModel> getPopularMovies(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("movie/top_rated")
  Future<MovieResponseModel> getTopRatedMovies(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("movie/now_playing")
  Future<MovieResponseModel> getNowPlayingMovies(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("movie/upcoming")
  Future<MovieResponseModel> getUpcomingMovies(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("movie/{movie_id}")
  Future<MovieDetailModel> getMovieDetails(
    @Path("movie_id") int movieId,
    @Query("api_key") String apiKey,
    @Query("language") String language,
  );

  @GET("search/movie")
  Future<MovieResponseModel> searchMovies(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("query") String query,
    @Query("page") int page,
  );
}
