import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/repos/movie_suggestion_repo.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestions_state.dart';


class MovieSugestionsCubit extends Cubit<MovieSugestionsState> {
  final MovieSuggestionRepo _movieSuggestionRepo;
  MovieSugestionsCubit(this._movieSuggestionRepo) : super(MovieSugestionsInitial());
  Future<void>loadSuggestions(String movieID) async {
    emit(MovieSugestionsLoading());
    try{
      final data=await _movieSuggestionRepo.getSugestions(movieID);
      emit(MovieSugestionsSuccess(data));
    }
    catch (error){
      String errorMessage;
      if(error is DioException){
        errorMessage=error.message??'Dio Error occured';
      }
      else{
        errorMessage=error.toString();
      }
      emit(MovieSugestionsError(errorMessage));
    }
  }
}
