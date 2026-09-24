import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/history/data/repos/history_repo.dart';
import 'package:movies/features/history/presentation/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo _historyRepo;

  HistoryCubit(this._historyRepo) : super(const HistoryInitial());

  Future<void> fetchHistory() async {
    emit(const HistoryLoading());
    try {
      final movies = await _historyRepo.getWatchHistory();
      if (isClosed) return;
      emit(HistoryLoaded(movies));
    } catch (e) {
      if (isClosed) return;
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> addToHistory(Movie movie) async {
    try {
      await _historyRepo.addMovieToHistory(movie);
      if (isClosed) return;
      emit(const HistoryAddSuccess());
      await fetchHistory();
    } catch (e) {
      if (isClosed) return;
      emit(HistoryError(e.toString()));
    }
  }
}

