import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';

class DioClient {
  DioClient._internal()
      : _dio = Dio(BaseOptions(baseUrl: ApiConstants.moviesBaseUrl));

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  final Dio _dio;

  Dio get instance => _dio;
}