import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/search/data/datasources/search_remote_data_source.dart';
import 'package:movies/features/search/data/repos/search_repo.dart';

class SearchRepoImp implements SearchRepo{
  final SearchRemoteDataSource _searchRemoteDataSource;
  SearchRepoImp(this._searchRemoteDataSource);
  @override
  Future<List<Movie>> search(String queryItem) async {
    return await _searchRemoteDataSource.search(queryItem);
  }
}