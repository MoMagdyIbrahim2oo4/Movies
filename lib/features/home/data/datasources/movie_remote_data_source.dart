import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/core/network/dio_exception_message.dart';

abstract interface class MovieDataSource {
  Future<List<Movie>> getMovies();
}

class MovieRemoteDataSource implements MovieDataSource {
  ApiService apiService;
  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<Movie>> getMovies() async {
    final movies = await apiService.getMovies();
    return movies;
  }
}
