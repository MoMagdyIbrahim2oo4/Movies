part of 'movie_category_cubit.dart';

@immutable
sealed class MovieCategoryState {}

final class MovieCategoryInitial extends MovieCategoryState {}

final class MovieCategoryLoadingState extends MovieCategoryState {}

final class MovieCategoryFailureState extends MovieCategoryState {
  final String errorMessage;

  MovieCategoryFailureState(this.errorMessage);
}

final class MovieCategorySuccessState extends MovieCategoryState {
  final List<Movie> categories;
  MovieCategorySuccessState(this.categories);
}
