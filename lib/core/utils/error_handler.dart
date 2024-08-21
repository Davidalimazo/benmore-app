

import 'package:benmore/core/exceptions/network_exception.dart';

import '../utils/network_utils.dart' as network_utils;

class ErrorHandler {
  static parseError(dynamic e, [bool decrypt = false]) {
    Map data = network_utils.decodeResponseBodyToJson(e.response?.data);
    if(e.response == null) {
      throw NetworkException(
        'Connection error'
      );
    }
    if(data['title'] != null) {
      throw NetworkException(
        data['title']
      );
    }
    if(data is String) {
      if(data['errors'] is String) {
        throw NetworkException(
          // ignore: unnecessary_null_comparison
          data != null ? 
          data['errors'] != null ? 
          data['errors'][0] : 
          e.message : 
          e.message
        );
      } else if(data['errors'].runtimeType is List) {
        String error = '';
        for(String item in data['errors']) {
          bool nextLine = error.isNotEmpty;
          error = error+'$item${nextLine ? '\n' : ''}';
        }
        throw NetworkException(
          error
        );
      } else {
        String error = '';
        Map<String, dynamic> errors = data['errors'];
        for(String item in errors.keys) {
          bool nextLine = error.isNotEmpty;
          error = error+'${errors[item]}${nextLine ? '\n' : ''}';
        }
        throw NetworkException(
          error
        );
      }
    } else {
      if(data['errors'] is String) {
        throw NetworkException(
          data != null ? 
          data['errors'] != null ? 
          data['errors'][0] : 
          e.message : 
          e.message
        );
      } else if(data['errors'] is List) {
        String error = '';
        for(String item in data['errors']) {
          bool nextLine = error.isNotEmpty;
          error = error+'$item${nextLine ? '\n' : ''}';
        }
        throw NetworkException(
          error
        );
      } else {
        String error = '';
        Map<String, dynamic> errors = data['errors'];
        for(String item in errors.keys) {
          bool nextLine = error.isNotEmpty;
          error = error+'${errors[item]}${nextLine ? '\n' : ''}';
        }
        throw NetworkException(
          error
        );
      }
    }
  }

  static String? parseValidationErrors(List? errors) {
    if(errors == null) {
      return null;
    }
    String error = '';
    for(String item in errors??[]) {
      bool nextLine = error.isNotEmpty;
      error = '$error $item${nextLine ? '\n' : ''}';
      print('ERRRRRR: $error');
    }
    return error;
  }
}
