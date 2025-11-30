import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_todo_state.dart';

class NewTodoCubit extends Cubit<NewTodoState> {
  NewTodoCubit() : super(NewTodoState.initial());

  void assignNewTodoContent({String? title, String? description}) => emit(
    state.copyWith(
      newTodoTitle: title ?? state.newTodoTitle,
      newTodoDescription: description ?? state.newTodoDescription,
      status: NewTodoStatus.assignNewTodoContent,
    ),
  );

  void toggleSendButton() => emit(
    state.copyWith(
      isSendButtonEnabled:
          state.newTodoTitle.isNotEmpty && state.newTodoDescription.isNotEmpty,
      status: NewTodoStatus.toggleSendButton,
    ),
  );
}
