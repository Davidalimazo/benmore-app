import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/env_data.dart';
import 'package:benmore/core/utils/error_entity.dart';
import 'package:benmore/models/formatted_response.dart';
import 'package:benmore/models/user/user.dart';
import 'package:benmore/services/http/http_service.dart';
import 'package:benmore/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl implements HttpService {
  final UserService _userService = locator<UserService>();
  User? get pensioner => _userService.user;

  bool isProduction = kReleaseMode;

  late Dio _dio;

  CancelToken cancelToken = CancelToken();

  static final HttpServiceImpl _instance = HttpServiceImpl._internal();

  factory HttpServiceImpl() {
    return _instance;
  }

  HttpServiceImpl._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: dotenv.env[EnvData.BASE_URL] as String,
        connectTimeout: 50.seconds,
        receiveTimeout: 50.seconds,
        headers: {
          'x-api-key': dotenv.env[EnvData.API_KEY] as String,
        },
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    _dio = Dio(options);

    _dio.interceptors.addAll([
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90)
    ]);

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException e, handler) {
      return handler.next(e);
    }));
  } //finish internal()
  @override
  Future<FormattedResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await _dio.get(path,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken);
    return FormattedResponse.fromMap(response.data);
  }

  @override
  Future<FormattedResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken);

    return FormattedResponse.fromMap(response.data);
  }

  @override
  Future<List<int>> download(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await _dio.get(
      path,
      cancelToken: cancelToken,
      options: Options(
        responseType: ResponseType.bytes, // Ensure response is in bytes
        headers: requestOptions.headers,
      ),
      data: data,
    );

    return response.data;
  }

  @override
  Future<FormattedResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken);

    return FormattedResponse.fromMap(response.data);
  }

  @override
  Future<FormattedResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await _dio.delete(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken);

    return FormattedResponse.fromMap(response.data);
  }

  @override
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "Connection timed out");

      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "Send timed out");

      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "Receive timed out");

      case DioExceptionType.badCertificate:
        return ErrorEntity(code: -1, message: "Bad SSL certificates");

      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case 400:
            return ErrorEntity(
                code: 400, message: "${error.response?.data["message"]}");
          case 401:
            return ErrorEntity(
                code: 401, message: "${error.response?.data["message"]}");
          case 403:
            return ErrorEntity(
                code: 401, message: "${error.response?.data["message"]}");
          case 500:
            return ErrorEntity(
                code: 500, message: "Something went wrong, please try again");
        }
        return ErrorEntity(
            code: error.response!.statusCode!,
            message: "${error.response?.data["message"]}");

      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "Server canceled it");

      case DioExceptionType.connectionError:
        return ErrorEntity(code: -1, message: "Connection error");

      case DioExceptionType.unknown:
        return ErrorEntity(code: -1, message: "Unknown error");
    }
  }

  @override
  void dispose() {
    _dio.interceptors.clear();
    _dio.close(force: true);
  }
}
