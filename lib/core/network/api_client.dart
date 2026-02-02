import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:leggo/core/utils/constants.dart';
import 'package:leggo/core/utils/flavors.dart' show F;

@lazySingleton
class ApiClient {
  late final Dio _dio;
  ApiClient() {
    final baseUrl = F.baseUrl;
    if (baseUrl.isEmpty) {
      throw Exception('BASE_DOMAIN not found in .env');
    }
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ),
    );
  }

  Options _getOptions(String? authToken) {
    if (authToken != null) {
      return Options(headers: {AppConstants.authHeader: authToken});
    }
    return Options();
  }

  /// Performs a GET request.
  Future<dynamic> get(String path, {String? authToken}) async {
    try {
      final response = await _dio.get(path, options: _getOptions(authToken));
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a POST request.
  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    String? authToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        options: _getOptions(authToken),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a PUT request.
  Future<dynamic> put(
    String path,
    Map<String, dynamic> body, {
    String? authToken,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
        options: _getOptions(authToken),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a DELETE request.
  Future<void> delete(String path, {String? authToken}) async {
    try {
      await _dio.delete(path, options: _getOptions(authToken));
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Converts [DioException] into a standard [HttpException].
  Exception _handleDioError(DioException e) {
    return HttpException(
      e.message ?? 'Unknown error occurred',
      statusCode: e.response?.statusCode,
    );
  }
}

/// Custom Exception class for API errors.
class HttpException implements Exception {
  final String message;
  final int? statusCode;
  HttpException(this.message, {this.statusCode});

  @override
  String toString() => 'HttpException: $message (Status: $statusCode)';
}
