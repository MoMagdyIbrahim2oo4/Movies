import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/data/repos/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());
  final MovieDetailsRepo movieDetailsRepo;

  Future<void> getMoviesDetails({required String movieId}) async {
    emit(MovieDetailsLoading());
    final result = await movieDetailsRepo.getMoviesDetails(movieId);
    if (isClosed) return;
    result.when(
      success: (movieDetails) =>
          emit(MovieDetailsSuccess(movieDetails: movieDetails)),
      failure: (errorMessage) => emit(MovieDetailsFailuure(errorMessage)),
    );
  }
}
