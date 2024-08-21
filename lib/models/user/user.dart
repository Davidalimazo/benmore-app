import 'package:benmore/core/enums/app_adapters.dart';
import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/type_ids.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: TypeId.user, adapterName: AppHiveAdapters.userAdapter)
class User with _$User {
  const factory User(
      {@HiveField(0) String? id,
      @HiveField(1) String? username,
      @HiveField(2) String? first_name,
      @HiveField(3) String? email,
      @HiveField(4) String? profile_picture,
      @HiveField(5) List<String>? followers,
      @HiveField(6) List<String>? posts,
      @HiveField(7) String? createdAt,
      @HiveField(8) String? updatedAt}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
