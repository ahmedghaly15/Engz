// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  title: json['title'] as String?,
  description: json['description'] as String?,
  dateTime: json['dateTime'] == null
      ? null
      : DateTime.parse(json['dateTime'] as String),
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  priority: (json['priority'] as num?)?.toInt(),
  isCompleted: json['isCompleted'] as bool?,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'dateTime': instance.dateTime?.toIso8601String(),
  'category': instance.category?.toJson(),
  'priority': instance.priority,
  'isCompleted': instance.isCompleted,
};
