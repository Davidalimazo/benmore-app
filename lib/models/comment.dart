// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:benmore/models/user/user.dart';

class Comment {
  User user;
  String comment;
  DateTime timestamp;
  Comment({
    required this.user,
    required this.comment,
    required this.timestamp,
  });

  Comment copyWith({
    User? user,
    String? comment,
    DateTime? timestamp,
  }) {
    return Comment(
      user: user ?? this.user,
      comment: comment ?? this.comment,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'comment': comment,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      user: map['user'],
      comment: map['comment'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Comment(user: $user, comment: $comment, timestamp: $timestamp)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.comment == comment &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => user.hashCode ^ comment.hashCode ^ timestamp.hashCode;
}
