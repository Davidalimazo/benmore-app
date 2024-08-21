// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 3;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      assigned_to: fields[0] as String?,
      description: fields[1] as String?,
      image_url: fields[2] as String?,
      created_at: fields[3] as DateTime?,
      comments: fields[4] as Comment?,
      likes: fields[5] as int?,
      status: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.assigned_to)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image_url)
      ..writeByte(3)
      ..write(obj.created_at)
      ..writeByte(4)
      ..write(obj.comments)
      ..writeByte(5)
      ..write(obj.likes)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      assigned_to: json['assigned_to'] as String?,
      description: json['description'] as String?,
      image_url: json['image_url'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      comments: json['comments'] == null
          ? null
          : Comment.fromJson(json['comments'] as String),
      likes: (json['likes'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'assigned_to': instance.assigned_to,
      'description': instance.description,
      'image_url': instance.image_url,
      'created_at': instance.created_at?.toIso8601String(),
      'comments': instance.comments,
      'likes': instance.likes,
      'status': instance.status,
    };
