import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/repos/movie_suggestion_repo.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestions_state.dart';

class MovieSugestionsCubit extends Cubit<MovieSugestionsState> {
  final MovieSuggestionRepo _movieSuggestionRepo;

  MovieSugestionsCubit(this._movieSuggestionRepo)
      : super(MovieSugestionsInitial());

  Future<void> loadSuggestions(String movieID) async {
    emit(MovieSugestionsLoading());
    final result = await _movieSuggestionRepo.getSugestions(movieID);
    if (isClosed) return;
    result.when(
      success: (movies) => emit(MovieSugestionsSuccess(movies)),
      failure: (errorMessage) => emit(MovieSugestionsError(errorMessage)),
    );
  }
}
