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

  void updateTodo(int index, Todo updatedTodo) {
    final updatedTodos = [...state.todos]..[index] = updatedTodo;
    emit(state.copyWith(todos: updatedTodos, status: HomeStatus.updateTodo));
  }

  void deleteTodo(int index) {
    final updatedTodos = [...state.todos]..removeAt(index);
    emit(state.copyWith(todos: updatedTodos, status: HomeStatus.deleteTodo));
  }

  void completeTodo(Todo todo) {
    final updatedTodo = todo.copyWith(isCompleted: true);
    final index = state.todos.indexOf(todo);
    updateTodo(index, updatedTodo);
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) => HomeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(HomeState state) => state.toJson();
}
