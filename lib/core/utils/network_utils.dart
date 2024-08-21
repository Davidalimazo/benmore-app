import 'dart:convert' as convert;

import 'package:benmore/core/exceptions/network_exception.dart';
import 'package:benmore/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void checkForNetworkExceptions(Response response) {
  if (response.statusCode! < 200 || response.statusCode! >= 400) {
    throw const NetworkException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    if(dotenv.env['APP_DEBUG'] == 'true') {
      Logger.d('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    if(dotenv.env['APP_DEBUG'] == 'true') {
      Logger.e('Network Utils: Failed to decode response body ${e.message}');
    }
    if (e.message.contains('Unexpected')) {
      throw NetworkException(
          'Oops! Something went wrong while processing your request. Please try again later.');
    } else {
      throw NetworkException(e.message);
    }
  }
}