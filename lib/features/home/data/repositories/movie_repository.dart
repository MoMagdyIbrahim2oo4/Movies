import 'package:movies/core/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}