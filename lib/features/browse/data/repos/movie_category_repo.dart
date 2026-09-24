import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_result.dart';

abstract interface class MovieCategoryRepo {
  Future<ApiResult<List<Movie>>> getCategoryMovies(String genre);
}