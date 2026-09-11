import 'package:dio/dio.dart';

class DioExceptionMessage {
  const DioExceptionMessage._();

  static String from(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout =>
      'The movies service took too long to respond.',
      DioExceptionType.connectionError =>
      'Could not connect to the movies service.',
      DioExceptionType.cancel => 'The movies request was cancelled.',
      DioExceptionType.badResponse => _badResponse(error.response),
      DioExceptionType.badCertificate =>
      'The movies service certificate is invalid.',
      DioExceptionType.unknown =>
      'An unexpected movies service error occurred.',
    };
  }

  static String _badResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;

    if (statusCode == null) {
      return 'The movies service returned an invalid response.';
    }

    if (statusCode >= 500) {
      return 'The movies service is currently unavailable.';
    }

    if (statusCode >= 400) {
      return 'The movies service rejected the request.';
    }

    return 'The movies service returned an invalid response.';
  }
}