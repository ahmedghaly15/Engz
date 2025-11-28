import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
sealed class Todo with _$Todo {
  @JsonSerializable(explicitToJson: true)
  const factory Todo({
    String? title,
    String? description,
    DateTime? dateTime,
    Category? category,
    int? priority,
    bool? isCompleted,
  }) = _Todo;
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
