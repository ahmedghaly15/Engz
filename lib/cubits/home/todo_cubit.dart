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

  void updateTodoById(Todo updatedTodo) {
    final updatedList = state.todos.map((todo) {
      if (todo.id == updatedTodo.id) {
        return todo.copyWith(
          title: updatedTodo.title,
          description: updatedTodo.description,
          dateTime: updatedTodo.dateTime,
          category: updatedTodo.category,
          priority: updatedTodo.priority,
          isCompleted: updatedTodo.isCompleted,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: updatedList, status: TodoStatus.updateTodo));
  }

  void deleteTodo(int index) {
    final updatedTodos = [...state.todos]..removeAt(index);
    emit(state.copyWith(todos: updatedTodos, status: TodoStatus.deleteTodo));
  }

  void toggleCompleteTodo(String id) {
    final updatedTodos = state.todos
        .map(
          (todo) => todo.id == id
              ? todo.copyWith(isCompleted: !todo.isCompleted)
              : todo,
        )
        .toList();
    emit(
      state.copyWith(
        todos: updatedTodos,
        status: TodoStatus.toggleCompleteTodo,
      ),
    );
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
