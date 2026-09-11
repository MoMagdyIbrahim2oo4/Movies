import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/core/network/dio_exception_message.dart';

abstract interface class MovieDataSource {
  Future<List<Movie>> getMovies();
}

class MovieRemoteDataSource implements MovieDataSource {
  final DioClient _dioClient;

  MovieRemoteDataSource({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dioClient.instance.get<Map<String, dynamic>>(
        ApiConstants.listMoviesEndpoint,
      );
      final data = response.data?['data'];

      if (data is! Map<String, dynamic>) {
        throw const FormatException(
          'The movies response has an invalid data field.',
        );
      }

      final movies = data['movies'];
      if (movies is! List) {
        throw const FormatException(
          'The movies response has no valid movies list.',
        );
      }

      return movies
          .whereType<Map<String, dynamic>>()
          .map(Movie.fromJson)
          .toList(growable: false);
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