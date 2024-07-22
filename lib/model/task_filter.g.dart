// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskFilterImpl _$$TaskFilterImplFromJson(Map<String, dynamic> json) =>
    _$TaskFilterImpl(
      id: json['id'] as String,
      timeLeft: json['timeLeft'] == null
          ? null
          : Duration(microseconds: (json['timeLeft'] as num).toInt()),
      textQuery: json['textQuery'] as String?,
      includedTags: (json['includedTags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toSet(),
      excludedTags: (json['excludedTags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toSet(),
      priority: intRangeFromJson(json['priority'] as String),
      createdDate: dateTimeRangeFromJson(json['createdDate'] as String),
      dueDate: dateTimeRangeFromJson(json['dueDate'] as String),
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$$TaskFilterImplToJson(_$TaskFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeLeft': instance.timeLeft?.inMicroseconds,
      'textQuery': instance.textQuery,
      'includedTags': instance.includedTags?.toList(),
      'excludedTags': instance.excludedTags?.toList(),
      'priority': intRangeToJson(instance.priority),
      'createdDate': dateTimeRangeToJson(instance.createdDate),
      'dueDate': dateTimeRangeToJson(instance.dueDate),
      'isDone': instance.isDone,
    };
