import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/todo.dart';

part 'todo_state.freezed.dart';
part 'todo_state.g.dart';

enum HomeStatus { initial, completeTodo, addTodo, updateTodo, deleteTodo }

extension HomeStatusExt on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isCompleteTodo => this == HomeStatus.completeTodo;
  bool get isAddTodo => this == HomeStatus.addTodo;
  bool get isUpdateTodo => this == HomeStatus.updateTodo;
  bool get isDeleteTodo => this == HomeStatus.deleteTodo;
}

@freezed
sealed class HomeState with _$HomeState {
  @JsonSerializable(explicitToJson: true)
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<Todo> todos,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
