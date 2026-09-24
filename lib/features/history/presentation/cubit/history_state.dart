import 'package:movies/core/models/movie_model.dart';

sealed class HistoryState {
  const HistoryState();
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

final class HistoryLoaded extends HistoryState {
  final List<Movie> movies;
  const HistoryLoaded(this.movies);
}

final class HistoryAddSuccess extends HistoryState {
  const HistoryAddSuccess();
}

final class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
}

