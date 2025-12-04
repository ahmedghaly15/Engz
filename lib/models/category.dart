import 'package:engz/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

enum CategoryType {
  grocery,
  work,
  sport,
  design,
  university,
  social,
  music,
  health,
  movie,
  home,
}

@freezed
sealed class Category with _$Category {
  const factory Category(CategoryType type) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryExtension on CategoryType {
  String get typeName => name.capitalize();

  String get iconPath {
    const String base = 'assets/svgs/';
    return '$base$name-icon.svg';
  }

  Color get color {
    switch (this) {
      case CategoryType.grocery:
        return const Color(0xffCCFF80);
      case CategoryType.work:
        return const Color(0xffFF9680);
      case CategoryType.sport:
        return const Color(0xff80FFFF);
      case CategoryType.design:
        return const Color(0xff80FFD9);
      case CategoryType.university:
        return const Color(0xff809CFF);
      case CategoryType.social:
        return const Color(0xffFF80EB);
      case CategoryType.music:
        return const Color(0xffFC80FF);
      case CategoryType.health:
        return const Color(0xff80FFA3);
      case CategoryType.movie:
        return const Color(0xff80D1FF);
      case CategoryType.home:
        return const Color(0xffFFCC80);
    }
  }
}
