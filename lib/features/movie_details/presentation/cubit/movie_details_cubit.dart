import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/data/repos/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());
  final MovieDetailsRepo movieDetailsRepo;
  Future<void> getMoviesDetails({required String movieId}) async {
    emit(MovieDetailsLoading());
    try {
      final movies = await movieDetailsRepo.getMoviesDetails(movieId);
      emit(MovieDetailsSuccess(movieDetails: movies));
    } on Exception catch (e) {
      String? errorMessage;
      if (e is DioException) {
        errorMessage = e.message;
      }
      errorMessage = e.toString();
      emit(MovieDetailsFailuure(errorMessage));
    }
  }
}
