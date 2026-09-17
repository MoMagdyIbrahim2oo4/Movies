import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';

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
