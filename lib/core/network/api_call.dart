import 'package:movies/core/network/api_result.dart';
import 'package:movies/core/network/dio_exception_message.dart';

Future<ApiResult<T>> apiCall<T>(Future<T> Function() action) async {
  try {
    return ApiResult.success(await action());
  } catch (error) {
    return ApiResult.failure(DioExceptionMessage.from(error).message);
  }
}

// Alias for PascalCase compatibility
// ignore: non_constant_identifier_names
// Future<ApiResult<T>> ApiCall<T>(Future<T> Function() action) => apiCall(action);
