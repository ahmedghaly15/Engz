// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoState _$TodoStateFromJson(Map<String, dynamic> json) => _TodoState(
  status:
      $enumDecodeNullable(_$TodoStatusEnumMap, json['status']) ??
      TodoStatus.initial,
  todos:
      (json['todos'] as List<dynamic>?)
          ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  showCompleted: json['showCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$TodoStateToJson(_TodoState instance) =>
    <String, dynamic>{
      'status': _$TodoStatusEnumMap[instance.status]!,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'showCompleted': instance.showCompleted,
    };

const _$TodoStatusEnumMap = {
  TodoStatus.initial: 'initial',
  TodoStatus.completeTodo: 'completeTodo',
  TodoStatus.addTodo: 'addTodo',
  TodoStatus.updateTodo: 'updateTodo',
  TodoStatus.deleteTodo: 'deleteTodo',
  TodoStatus.toggleShowCompletedTodos: 'toggleShowCompletedTodos',
};
