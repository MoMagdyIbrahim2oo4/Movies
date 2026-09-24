import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/repositories/movie_repository.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieRepository repository;

  HomeCubit({required this.repository}) : super(const HomeInitial());

  Future<void> loadMovies() async {
    emit(const HomeLoading());
    final result = await repository.getMovies();
    if (isClosed) return;
    result.when(
      success: (movies) => emit(HomeSuccess(movies)),
      failure: (message) => emit(HomeFailure(message)),
    );
  }
}
