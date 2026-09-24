import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_result.dart';

abstract class MovieSuggestionRepo {
  Future<ApiResult<List<Movie>>> getSugestions(String movieID);
}
