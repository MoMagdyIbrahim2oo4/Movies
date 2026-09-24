import 'package:movies/core/network/api_call.dart';
import 'package:movies/core/network/api_result.dart';
import 'package:movies/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

class MovieDetailsRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepo(this.movieDetailsRemoteDataSource);

  Future<ApiResult<MovieDetails?>> getMoviesDetails(String movieId) async {
    return apiCall(
      () => movieDetailsRemoteDataSource.getMoviesDetails(movieId),
    );
  }
}
