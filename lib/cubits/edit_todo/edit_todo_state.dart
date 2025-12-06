import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/todo.dart';

part 'edit_todo_state.freezed.dart';

enum EditTodoStatus {
  initial,
  initTodo,
  editTodoContent,
  editTodoCategory,
  editTodoPriority,
  triggerDeleteTodo,
}

extension EditTodoStatusExt on EditTodoStatus {
  bool get isEditTodoContent => this == EditTodoStatus.editTodoContent;
  bool get isTriggerDeleteTodo => this == EditTodoStatus.triggerDeleteTodo;
}

@freezed
sealed class EditTodoState with _$EditTodoState {
  const factory EditTodoState({
    @Default(EditTodoStatus.initial) EditTodoStatus status,
    Todo? todo,
  }) = _EditTodoState;

  factory EditTodoState.initial() => const EditTodoState();
}
