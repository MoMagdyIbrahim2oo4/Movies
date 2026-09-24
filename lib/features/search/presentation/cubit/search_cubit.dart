import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());
  Future<void> search(String queryItem) async {
    emit(SearchLoading());
    try {
      final result = await _searchRepo.search(queryItem);
      emit(SearchSuccess(result));
    } catch (error) {
      String message;
      if (error is DioException) {
        message = error.message ?? 'Unknown Error';
      } else {
        message = error.toString();
      }
      emit(SearchFailure(message));
    }
  }
}
