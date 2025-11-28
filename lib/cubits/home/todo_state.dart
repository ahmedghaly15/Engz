import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/todo.dart';

part 'todo_state.freezed.dart';
part 'todo_state.g.dart';

enum HomeStatus {
  initial,
  completeTodo,
  addTodo,
  updateTodo,
  deleteTodo,
  showCompletedTodos,
  showTodos,
}

extension HomeStatusExt on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isCompleteTodo => this == HomeStatus.completeTodo;
  bool get isAddTodo => this == HomeStatus.addTodo;
  bool get isUpdateTodo => this == HomeStatus.updateTodo;
  bool get isDeleteTodo => this == HomeStatus.deleteTodo;
  bool get isShowCompletedTodos => this == HomeStatus.showCompletedTodos;
  bool get isShowTodos => this == HomeStatus.showTodos;
}

@freezed
sealed class HomeState with _$HomeState {
  @JsonSerializable(explicitToJson: true)
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<Todo> todos,
    @Default(false) bool showCompleted,
    @Default(false) bool showTodos,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
