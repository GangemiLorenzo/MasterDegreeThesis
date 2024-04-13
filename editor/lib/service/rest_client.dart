import 'package:dio/dio.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:injectable/injectable.dart';

/// Very basic rest client for REST API calls
@singleton
class RestClient {
  final Dio dio;

  RestClient({
    required this.dio,
  });

  /// Performs a GET request
  ///  - [api] - the API endpoint
  ///  - [baseUrl] - the base URL
  ///  - [headers] - the request headers
  ///  - [queryParameters] - the query parameters
  Future<Response> get({
    required String api,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async =>
      dio.get(
        '${baseUrl ?? Env().beUrl}$api',
        options: Options(
          headers: headers,
        ),
        queryParameters: {
          ...defaultQueryParameters,
          ...queryParameters ?? {},
        },
      );

  Map<String, dynamic> get defaultQueryParameters => {};
}
