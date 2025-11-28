// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeState _$HomeStateFromJson(Map<String, dynamic> json) => _HomeState(
  status:
      $enumDecodeNullable(_$HomeStatusEnumMap, json['status']) ??
      HomeStatus.initial,
  todos:
      (json['todos'] as List<dynamic>?)
          ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  showCompleted: json['showCompleted'] as bool? ?? false,
  showTodos: json['showTodos'] as bool? ?? false,
);

Map<String, dynamic> _$HomeStateToJson(_HomeState instance) =>
    <String, dynamic>{
      'status': _$HomeStatusEnumMap[instance.status]!,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'showCompleted': instance.showCompleted,
      'showTodos': instance.showTodos,
    };

const _$HomeStatusEnumMap = {
  HomeStatus.initial: 'initial',
  HomeStatus.completeTodo: 'completeTodo',
  HomeStatus.addTodo: 'addTodo',
  HomeStatus.updateTodo: 'updateTodo',
  HomeStatus.deleteTodo: 'deleteTodo',
  HomeStatus.showCompletedTodos: 'showCompletedTodos',
  HomeStatus.showTodos: 'showTodos',
};
