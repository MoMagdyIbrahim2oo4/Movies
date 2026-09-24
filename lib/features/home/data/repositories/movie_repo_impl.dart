import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_call.dart';
import 'package:movies/core/network/api_result.dart';
import 'package:movies/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/home/data/repositories/movie_repository.dart';

class MovieRepoImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  const MovieRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<Movie>>> getMovies() async {
    return apiCall(() => _dataSource.getMovies());
  }
}
