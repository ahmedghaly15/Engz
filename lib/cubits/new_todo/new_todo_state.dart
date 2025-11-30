import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_todo_state.freezed.dart';

enum NewTodoStatus { initial, assignNewTodoContent, toggleSendButton }

@freezed
sealed class NewTodoState with _$NewTodoState {
  const factory NewTodoState({
    @Default(NewTodoStatus.initial) NewTodoStatus status,
    @Default(false) bool isSendButtonEnabled,
    @Default('') String newTodoTitle,
    @Default('') String newTodoDescription,
  }) = _NewTodoState;

  factory NewTodoState.initial() => const NewTodoState();
}
