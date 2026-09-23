import 'package:movies/core/models/movie_model.dart';

abstract class SearchRepo {
  Future<List<Movie>>search(String queryItem);
}