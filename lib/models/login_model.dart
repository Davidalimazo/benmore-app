// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:benmore/models/user/user.dart';

class LoginModel {
  User user;
  String token;
  String refreshToken;
  LoginModel({
    required this.user,
    required this.token,
    required this.refreshToken,
  });

  LoginModel copyWith({
    User? user,
    String? token,
    String? refreshToken,
  }) {
    return LoginModel(
      user: user ?? this.user,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      user: map['user'],
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(user: $user, token: $token, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.user == user &&
      other.token == token &&
      other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode ^ refreshToken.hashCode;
}
