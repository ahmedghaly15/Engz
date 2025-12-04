import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/todo.dart';
import 'todo_state.dart';

class TodoCubit extends HydratedCubit<TodoState> {
  TodoCubit() : super(TodoState.initial());

  void addTodo(Todo todo) {
    final updatedTodos = [...state.todos, todo];
    final orderedTodos = updatedTodos
      ..sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
    emit(state.copyWith(todos: orderedTodos, status: TodoStatus.addTodo));
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

    emit(state.copyWith(todos: updatedTodos, status: TodoStatus.updateTodo));
  }

  void deleteTodo(int index) {
    final updatedTodos = [...state.todos]..removeAt(index);
    emit(state.copyWith(todos: updatedTodos, status: TodoStatus.deleteTodo));
  }

  void toggleCompleteTodo(int index) {
    final current = state.todos[index];
    final updated = current.copyWith(isCompleted: !current.isCompleted);
    final updatedTodos = [...state.todos]..[index] = updated;
    emit(state.copyWith(todos: updatedTodos, status: TodoStatus.completeTodo));
  }

  void toggleShowCompleted() => emit(
    state.copyWith(
      showCompleted: !state.showCompleted,
      status: TodoStatus.toggleShowCompletedTodos,
    ),
  );

  @override
  TodoState? fromJson(Map<String, dynamic> json) => TodoState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TodoState state) => state.toJson();
}
