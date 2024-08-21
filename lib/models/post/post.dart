import 'dart:core';

import 'package:hive/hive.dart';
import 'package:benmore/models/comment.dart';
import 'package:benmore/core/enums/app_adapters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../core/enums/type_ids.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
@HiveType(typeId: TypeId.post, adapterName: AppHiveAdapters.postAdapter)
class Post with _$Post {
  const factory Post(
      {@HiveField(0) String? assigned_to,
      @HiveField(1)  String? description,
      @HiveField(2)  String? image_url,
      @HiveField(3)  DateTime? created_at,
      @HiveField(4)  Comment? comments,
      @HiveField(5)  int? likes,
      @HiveField(6)  String? status
      
      }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

