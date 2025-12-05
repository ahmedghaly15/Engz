import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo.dart';
import 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  EditTodoCubit() : super(EditTodoState.initial());

  void initTodo(Todo todo) =>
      emit(state.copyWith(todo: todo, status: EditTodoStatus.initTodo));

  void editTodoContent({String? title, String? description}) {
    final oldTodo = state.todo;
    emit(
      state.copyWith(
        todo: state.todo!.copyWith(
          title: title ?? oldTodo?.title,
          description: description ?? oldTodo?.description,
        ),
        status: EditTodoStatus.editTodoContent,
      ),
    );
  }
}
