part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

// ignore: must_be_immutable
final class SearchFailure extends SearchState {
  String message;
  SearchFailure(this.message);
}

// ignore: must_be_immutable
final class SearchSuccess extends SearchState {
  List<Movie> movies;
  SearchSuccess(this.movies);
}
