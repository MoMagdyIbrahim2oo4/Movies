import 'package:movies/core/models/movie_model.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSuccess extends HomeState {
  final List<Movie> movies;

  const HomeSuccess(this.movies);
}

final class HomeFailure extends HomeState {
  final String message;

  const HomeFailure(this.message);
}