import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';

class MovieCategoryRemoteDataSource {
  final ApiService apiService;
  MovieCategoryRemoteDataSource(this.apiService);
    Future<List<Movie>> getCategoryMovies(String genre) async {
      final movies =await  apiService.getCategoryMovies(genre);
      return movies;
    }
}