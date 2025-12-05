import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo.dart' show CategoryType;
import 'new_todo_state.dart';

class NewTodoCubit extends Cubit<NewTodoState> {
  NewTodoCubit() : super(NewTodoState.initial());

  void assignNewTodoContent({String? title, String? description}) {
    final oldTitle = state.todo!.title;
    final oldDescription = state.todo!.description;
    emit(
      state.copyWith(
        todo: state.todo!.copyWith(
          title: title ?? oldTitle,
          description: description ?? oldDescription,
        ),
        status: NewTodoStatus.assignNewTodoContent,
      ),
    );
  }

  void toggleSendButton() {
    final todo = state.todo;
    emit(
      state.copyWith(
        isSendButtonEnabled:
            todo!.title!.isNotEmpty && todo.description!.isNotEmpty,
        status: NewTodoStatus.toggleSendButton,
      ),
    );
  }

  void assignDate(DateTime? dateTime) => emit(
    state.copyWith(
      todo: state.todo!.copyWith(dateTime: dateTime),
      status: NewTodoStatus.updateDate,
    ),
  );

  void selectCategory(CategoryType type) {
    if (state.todo!.category != type) {
      emit(
        state.copyWith(
          todo: state.todo!.copyWith(category: type),
          status: NewTodoStatus.selectCategory,
        ),
      );
    }
  }

  void selectPriority(int priority) {
    if (state.todo!.priority != priority) {
      emit(
        state.copyWith(
          todo: state.todo!.copyWith(priority: priority),
          status: NewTodoStatus.selectPriority,
        ),
      );
    }
  }
}
