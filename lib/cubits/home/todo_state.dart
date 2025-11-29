import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/todo.dart';

part 'todo_state.freezed.dart';
part 'todo_state.g.dart';

@freezed
sealed class TodoState with _$TodoState {
  @JsonSerializable(explicitToJson: true)
  const factory TodoState({
    @Default(TodoStatus.initial) TodoStatus status,
    @Default([]) List<Todo> todos,
    @Default(false) bool showCompleted,
  }) = _TodoState;

  factory TodoState.initial() => const TodoState();
  factory TodoState.fromJson(Map<String, dynamic> json) =>
      _$TodoStateFromJson(json);
}

enum TodoStatus {
  initial,
  completeTodo,
  addTodo,
  updateTodo,
  deleteTodo,
  toggleShowCompletedTodos,
}

extension TodoStatusExt on TodoStatus {
  bool get isInitial => this == TodoStatus.initial;
  bool get isCompleteTodo => this == TodoStatus.completeTodo;
  bool get isAddTodo => this == TodoStatus.addTodo;
  bool get isUpdateTodo => this == TodoStatus.updateTodo;
  bool get isDeleteTodo => this == TodoStatus.deleteTodo;
  bool get isShowCompletedTodos => this == TodoStatus.toggleShowCompletedTodos;
}
