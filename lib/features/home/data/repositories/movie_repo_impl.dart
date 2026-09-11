import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/home/data/repositories/movie_repository.dart';

class MovieRepoImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  const MovieRepoImpl(this._dataSource);

  @override
  Future<List<Movie>> getMovies() => _dataSource.getMovies();
}