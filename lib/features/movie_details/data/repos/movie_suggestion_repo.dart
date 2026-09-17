import 'package:movies/core/models/movie_model.dart';

abstract class MovieSuggestionRepo {
  Future<List<Movie>>getSugestions(String movieID);
}