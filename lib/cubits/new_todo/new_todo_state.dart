import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/functions/generate_random_id.dart';
import '../../models/category.dart';
import '../../models/todo.dart';

part 'new_todo_state.freezed.dart';

enum NewTodoStatus {
  initial,
  assignNewTodoContent,
  toggleSendButton,
  updateDate,
  selectCategory,
  selectPriority,
}

@freezed
sealed class NewTodoState with _$NewTodoState {
  const factory NewTodoState({
    @Default(NewTodoStatus.initial) NewTodoStatus status,
    @Default(false) bool isSendButtonEnabled,
    Todo? todo,
  }) = _NewTodoState;

  factory NewTodoState.initial() => NewTodoState(
    todo: Todo(
      id: generateRandomId(),
      title: '',
      description: '',
      dateTime: DateTime.now(),
      priority: 1,
      category: CategoryType.grocery,
    ),
  );
}
