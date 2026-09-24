import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_call.dart';
import 'package:movies/core/network/api_result.dart';
import 'package:movies/features/browse/data/datasources/movie_category_remote_data_source.dart';
import 'package:movies/features/browse/data/repos/movie_category_repo.dart';

class MovieCategoryRepoImpl implements MovieCategoryRepo {
  final MovieCategoryRemoteDataSource movieCategoryRemoteDataSource;
  MovieCategoryRepoImpl(this.movieCategoryRemoteDataSource);
  @override
  Future<ApiResult<List<Movie>>> getCategoryMovies(String genre) async {
    final movies = await movieCategoryRemoteDataSource.getCategoryMovies(genre);
    return apiCall(() async {
      return movies;
    });
  }
}
