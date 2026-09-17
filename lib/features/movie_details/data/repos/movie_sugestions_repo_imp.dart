import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/data/datasources/movie_sugesstions_remote_data_source.dart';
import 'package:movies/features/movie_details/data/repos/movie_suggestion_repo.dart';

class MovieSugestionsRepoImp implements MovieSuggestionRepo {
  final MovieSugestionsRemoteDataSource _movieSugestionsRemoteDataSource;
  MovieSugestionsRepoImp(this._movieSugestionsRemoteDataSource);

  @override
  Future<List<Movie>> getSugestions(String movieID) async {
    return await _movieSugestionsRemoteDataSource.getSuggestions(movieID);
  }
}
