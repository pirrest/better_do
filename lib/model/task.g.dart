// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      doneDate: json['doneDate'] == null
          ? null
          : DateTime.parse(json['doneDate'] as String),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isDone: json['isDone'] as bool? ?? false,
      isFullDay: json['isFullDay'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'createdDate': instance.createdDate.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'doneDate': instance.doneDate?.toIso8601String(),
      'tags': instance.tags,
      'files': instance.files,
      'isDone': instance.isDone,
      'isFullDay': instance.isFullDay,
    };
