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
  category: $enumDecodeNullable(_$CategoryTypeEnumMap, json['category']),
  priority: (json['priority'] as num?)?.toInt() ?? 1,
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'dateTime': instance.dateTime?.toIso8601String(),
  'category': _$CategoryTypeEnumMap[instance.category],
  'priority': instance.priority,
  'isCompleted': instance.isCompleted,
};

const _$CategoryTypeEnumMap = {
  CategoryType.grocery: 'grocery',
  CategoryType.work: 'work',
  CategoryType.sport: 'sport',
  CategoryType.design: 'design',
  CategoryType.university: 'university',
  CategoryType.social: 'social',
  CategoryType.music: 'music',
  CategoryType.health: 'health',
  CategoryType.movie: 'movie',
  CategoryType.home: 'home',
};
