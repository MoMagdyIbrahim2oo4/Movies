import 'package:movies/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

class MovieDetailsRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepo(this.movieDetailsRemoteDataSource);

  Future<MovieDetails?> getMoviesDetails(String movieId) async {
    final moviesDetails = await movieDetailsRemoteDataSource.getMoviesDetails(
      movieId,
    );
    return moviesDetails;
  }
}
