import 'package:movies/core/models/movie_model.dart';

sealed class MovieSugestionsState {}

final class MovieSugestionsInitial extends MovieSugestionsState {}

final class MovieSugestionsLoading extends MovieSugestionsState {}

final class MovieSugestionsSuccess extends MovieSugestionsState {
  final List<Movie> movies;

  MovieSugestionsSuccess(this.movies);
}

final class MovieSugestionsError extends MovieSugestionsState {
  final String message;

  MovieSugestionsError(this.message);
}