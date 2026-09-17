import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';

abstract class MovieSugestionsRemoteDataSource {
  Future<List<Movie>> getSuggestions(String movieID);
}

class MovieSugestionsRemoteDataSourceImp
    implements MovieSugestionsRemoteDataSource {
  final ApiService _apiService;
  MovieSugestionsRemoteDataSourceImp(this._apiService);

  @override
  Future<List<Movie>> getSuggestions(String movieID) async {
    return await _apiService.getSuggestions(movieID);
  }
}
