import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/history/data/datasources/history_remote_data_source.dart';

class HistoryRepo {
  final HistoryRemoteDataSource _dataSource;

  HistoryRepo(this._dataSource);

  Future<void> addMovieToHistory(Movie movie) async {
    await _dataSource.addMovieToHistory(movie);
  }

  Future<List<Movie>> getWatchHistory() async {
    return await _dataSource.getWatchHistory();
  }
}

