import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/repositories/movie_repository.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieRepository repository;

  HomeCubit({required this.repository}) : super(const HomeInitial());

  Future<void> loadMovies() async {
    emit(const HomeLoading());
    try {
      final movies = await repository.getMovies();
      emit(HomeSuccess(movies));
    } on DioException {
      emit(const HomeFailure('Could not connect to the movies service.'));
    } on FormatException catch (error) {
      emit(HomeFailure(error.message.toString()));
    }
  }
}