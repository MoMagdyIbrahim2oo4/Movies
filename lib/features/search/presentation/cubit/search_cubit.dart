import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());
  Future<void> search(String queryItem) async {
    emit(SearchLoading());
    final result = await _searchRepo.search(queryItem);
    result.when(
      success: (movies) => emit(SearchSuccess(movies)),
      failure: (message) => emit(SearchFailure(message)),
    );
  }
}
