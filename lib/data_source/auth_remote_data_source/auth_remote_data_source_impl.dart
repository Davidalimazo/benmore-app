import 'dart:convert';

import 'package:benmore/core/constants/api_routes.dart';
import 'package:benmore/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:benmore/models/app_error.dart';
import 'package:benmore/models/login_model.dart';
import 'package:benmore/models/user/user.dart';
import 'package:benmore/services/http/http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../config/locator.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, LoginModel>> login(
      {required String username, required String password}) async {
    try {
      final response = await _httpService.post(
        ApiRoutes.login,
        data: json.encode({username: username, password: password}),
      );
      User user = User.fromJson(response.data["user"]);
      return Right(LoginModel(
          user: user,
          token: response.data["token"],
          refreshToken: response.data["refreshToken"]));
    } on DioException catch (e) {
      String message = _httpService.createErrorEntity(e).message ?? '';
      String responseCode = e.response?.data["responseCode"] ?? 'Unknown error';

      return Left(AppError(
        message: message,
        responseCode: responseCode,
      ));
    }
  }
}
