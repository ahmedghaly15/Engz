import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/enums/todo_action.dart';
import '../../core/helpers/extensions.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';
import '../../models/edit_todo_pop_attributes.dart';

class EditTodoBlocListener extends StatelessWidget {
  const EditTodoBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoCubit, EditTodoState>(
      listenWhen: (_, current) => current.status.isTriggerDeleteTodo,
      listener: (ctx, state) => _listener(state.status, ctx),
      child: const SizedBox.shrink(),
    );
  }

  void _listener(EditTodoStatus status, BuildContext context) async {
    switch (status) {
      case EditTodoStatus.triggerDeleteTodo:
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => context.pop(
            EditTodoPopAttributes(
              action: TodoAction.delete,
              todo: context.read<EditTodoCubit>().state.todo!,
            ),
          ),
        );

        break;
      default:
        break;
    }
  }
}
