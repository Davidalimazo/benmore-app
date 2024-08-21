import 'package:benmore/core/utils/error_entity.dart';
import 'package:benmore/models/formatted_response.dart';
import 'package:dio/dio.dart';



abstract class HttpService {
  Future<FormattedResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future download(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<FormattedResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<FormattedResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<FormattedResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  ErrorEntity createErrorEntity(DioException error);
  void dispose();
}
