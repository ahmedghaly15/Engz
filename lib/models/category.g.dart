// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) =>
    _Category($enumDecode(_$CategoryTypeEnumMap, json['type']));

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'type': _$CategoryTypeEnumMap[instance.type]!,
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
