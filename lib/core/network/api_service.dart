import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/core/network/dio_exception_message.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
class ApiService {

  Future<List<Movie>> getMovies() async {
    try {
      final response = await DioClient.instance.get(
        ApiConstants.listMoviesEndpoint,
      );
      final movieResponse = MovieResponse.fromJson(response.data);
      return movieResponse.data?.movies ?? [];
    } on DioException catch (error) {
      throw DioException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: error.error,
        message: DioExceptionMessage.from(error),
      );
    }
  }
  Future<MovieDetails?> getMovieDetails({required String movieId}) async {
    try {
      final response = await DioClient.instance.get(
        ApiConstants.movieDetails,
        queryParameters: {ApiConstants.movieId: movieId,
          ApiConstants.withCast:true,
          ApiConstants.withImage:true
        },
      );
      var movieDetailsResponse = MovieDetailsResponse.fromJson(response.data);
      return movieDetailsResponse.data?.movie;
    } on DioException catch (e) {
      throw DioExceptionMessage.from(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<List<Movie>> getSuggestions(String movieId) async {
    try {
      final response = await DioClient.instance.get(
        ApiConstants.movieSugestions,
        queryParameters: {ApiConstants.moviesID: movieId},
      );
      final movieResponse = MovieResponse.fromJson(response.data);
      return movieResponse.data?.movies ?? [];
    } on DioException catch (error) {
      throw DioException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: error.error,
        message: DioExceptionMessage.from(error),
      );
    }
  }

    Future<List<Movie>> search(String queryItem) async {
    try {
      final response = await DioClient.instance.get(
        ApiConstants.listMoviesEndpoint,
        queryParameters: {ApiConstants.queryItem: queryItem},
      );
      final movieResponse = MovieResponse.fromJson(response.data);
      return movieResponse.data?.movies ?? [];
    } on DioException catch (error) {
      throw DioException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: error.error,
        message: DioExceptionMessage.from(error),
      );
    }
  }
}