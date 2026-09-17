import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/core/network/dio_exception_message.dart';

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
}
