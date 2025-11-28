import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/todo.dart';
import 'todo_state.dart';

class TodoCubit extends HydratedCubit<HomeState> {
  TodoCubit() : super(HomeState.initial());

  void addTodo(Todo todo) {
    emit(
      state.copyWith(todos: [...state.todos, todo], status: HomeStatus.addTodo),
    );
  }

  void updateTodo(int index, Todo todo) {
    final current = todo;

    final updated = current.copyWith(
      title: todo.title ?? current.title,
      description: todo.description ?? current.description,
      dateTime: todo.dateTime ?? current.dateTime,
      category: todo.category ?? current.category,
      priority: todo.priority ?? current.priority,
      isCompleted: todo.isCompleted ?? current.isCompleted,
    );

    final updatedTodos = [...state.todos]..[index] = updated;

    emit(state.copyWith(todos: updatedTodos, status: HomeStatus.updateTodo));
  }

  void deleteTodo(int index) {
    final updatedTodos = [...state.todos]..removeAt(index);
    emit(state.copyWith(todos: updatedTodos, status: HomeStatus.deleteTodo));
  }

  void completeTodo(int index) {
    final updated = state.todos[index].copyWith(isCompleted: true);
    updateTodo(index, updated);
  }

  void toggleShowCompleted() => emit(
    state.copyWith(
      showCompleted: !state.showCompleted,
      status: HomeStatus.showCompletedTodos,
    ),
  );

  void toggleShowTodos() => emit(
    state.copyWith(showTodos: !state.showTodos, status: HomeStatus.showTodos),
  );

  @override
  HomeState? fromJson(Map<String, dynamic> json) => HomeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(HomeState state) => state.toJson();
}
