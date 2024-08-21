import 'package:benmore/models/app_error.dart';
import 'package:benmore/models/post/post.dart';
import 'package:dartz/dartz.dart';


abstract class UtilRemoteDataSource {
  Future<Either<AppError, List<Post>>> getPosts();
}
