// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FormattedResponse extends Equatable {
  final bool status;
  final dynamic data;
  final String message;
  final String responseCode;
  const FormattedResponse({
    required this.status,
    required this.data,
    required this.message,
    required this.responseCode,
  });

  FormattedResponse copyWith({
    bool? status,
    dynamic data,
    String? message,
    String? responseCode,
  }) {
    return FormattedResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      responseCode: responseCode ?? this.responseCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data,
      'message': message,
      'responseCode': responseCode,
    };
  }

  factory FormattedResponse.fromMap(Map<String, dynamic> map) {
    return FormattedResponse(
      status: map['status'] as bool,
      data: map['data'] as dynamic,
      message: map['message'] as String,
      responseCode: map['responseCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormattedResponse.fromJson(String source) => FormattedResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, data, message, responseCode];
}
