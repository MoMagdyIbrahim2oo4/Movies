import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<Movie>>search(String quearyItem);
}

class SearchRemoteDataSourceImp implements SearchRemoteDataSource{
  final ApiService _apiService;
  SearchRemoteDataSourceImp(this._apiService);
  @override
  Future<List<Movie>> search(String queryItem) async {
    return await _apiService.search(queryItem);
  }
  
}