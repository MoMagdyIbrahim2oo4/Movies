import 'package:movies/core/network/api_service.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

class MovieDetailsRemoteDataSource {
  final ApiService apiService;
  MovieDetailsRemoteDataSource(this.apiService);
  Future<MovieDetails?> getMoviesDetails(String movieId) async {
    final moviesDetails = apiService.getMovieDetails(movieId: movieId);
    return moviesDetails;
  }
}
