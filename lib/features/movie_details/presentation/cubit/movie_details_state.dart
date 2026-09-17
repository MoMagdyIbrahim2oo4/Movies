part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails? movieDetails;

  MovieDetailsSuccess({required this.movieDetails});
}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailuure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailuure(this.errorMessage);
}
