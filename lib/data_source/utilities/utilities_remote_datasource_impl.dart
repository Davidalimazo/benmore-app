import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/api_routes.dart';
import 'package:benmore/data_source/utilities/utilities_remote_datasource.dart';
import 'package:benmore/models/app_error.dart';
import 'package:benmore/models/formatted_response.dart';
import 'package:benmore/models/post/post.dart';
import 'package:benmore/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';


class UtilRemoteDataSourceImpl implements UtilRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();
  @override
  Future<Either<AppError, List<Post>>> getPosts() async {
    try {
      final FormattedResponse res = await _httpService.get(ApiRoutes.post);
      List<Post> posts = (res.data as List<dynamic>)
          .map((json) => Post.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(posts);
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
