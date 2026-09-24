import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_result.dart';

abstract class MovieRepository {
  Future<ApiResult<List<Movie>>> getMovies();
}
