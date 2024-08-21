// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @HiveField(0)
  String? get assigned_to => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get image_url => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get created_at => throw _privateConstructorUsedError;
  @HiveField(4)
  Comment? get comments => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get likes => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@HiveField(0) String? assigned_to,
      @HiveField(1) String? description,
      @HiveField(2) String? image_url,
      @HiveField(3) DateTime? created_at,
      @HiveField(4) Comment? comments,
      @HiveField(5) int? likes,
      @HiveField(6) String? status});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assigned_to = freezed,
    Object? description = freezed,
    Object? image_url = freezed,
    Object? created_at = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      assigned_to: freezed == assigned_to
          ? _value.assigned_to
          : assigned_to // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Comment?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? assigned_to,
      @HiveField(1) String? description,
      @HiveField(2) String? image_url,
      @HiveField(3) DateTime? created_at,
      @HiveField(4) Comment? comments,
      @HiveField(5) int? likes,
      @HiveField(6) String? status});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assigned_to = freezed,
    Object? description = freezed,
    Object? image_url = freezed,
    Object? created_at = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? status = freezed,
  }) {
    return _then(_$PostImpl(
      assigned_to: freezed == assigned_to
          ? _value.assigned_to
          : assigned_to // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Comment?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {@HiveField(0) this.assigned_to,
      @HiveField(1) this.description,
      @HiveField(2) this.image_url,
      @HiveField(3) this.created_at,
      @HiveField(4) this.comments,
      @HiveField(5) this.likes,
      @HiveField(6) this.status});

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @HiveField(0)
  final String? assigned_to;
  @override
  @HiveField(1)
  final String? description;
  @override
  @HiveField(2)
  final String? image_url;
  @override
  @HiveField(3)
  final DateTime? created_at;
  @override
  @HiveField(4)
  final Comment? comments;
  @override
  @HiveField(5)
  final int? likes;
  @override
  @HiveField(6)
  final String? status;

  @override
  String toString() {
    return 'Post(assigned_to: $assigned_to, description: $description, image_url: $image_url, created_at: $created_at, comments: $comments, likes: $likes, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.assigned_to, assigned_to) ||
                other.assigned_to == assigned_to) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assigned_to, description,
      image_url, created_at, comments, likes, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {@HiveField(0) final String? assigned_to,
      @HiveField(1) final String? description,
      @HiveField(2) final String? image_url,
      @HiveField(3) final DateTime? created_at,
      @HiveField(4) final Comment? comments,
      @HiveField(5) final int? likes,
      @HiveField(6) final String? status}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  @HiveField(0)
  String? get assigned_to;
  @override
  @HiveField(1)
  String? get description;
  @override
  @HiveField(2)
  String? get image_url;
  @override
  @HiveField(3)
  DateTime? get created_at;
  @override
  @HiveField(4)
  Comment? get comments;
  @override
  @HiveField(5)
  int? get likes;
  @override
  @HiveField(6)
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
