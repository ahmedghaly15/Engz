import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';

class AssignNewTodoContentBlocListener extends StatelessWidget {
  const AssignNewTodoContentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTodoCubit, NewTodoState>(
      listenWhen: (_, current) =>
          _listenWhen(current.newTodoTitle, current.newTodoDescription),
      listener: (_, state) {
        switch (state.status) {
          case NewTodoStatus.assignNewTodoContent:
            context.read<NewTodoCubit>().toggleSendButton();
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  bool _listenWhen(String newTodoTitle, String newTodoDescription) =>
      newTodoTitle.isNotEmpty || newTodoDescription.isNotEmpty;
}
