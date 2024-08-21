import 'package:benmore/models/app_error.dart';
import 'package:benmore/models/login_model.dart';
import 'package:benmore/models/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppError, LoginModel>> login(
      {required String username, required String password});
}
