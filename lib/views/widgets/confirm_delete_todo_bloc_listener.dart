import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';

class ConfirmDeleteTodoBlocListener extends StatelessWidget {
  const ConfirmDeleteTodoBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoCubit, EditTodoState>(
      listenWhen: (_, current) => current.status.isTriggerDeleteTodo,
      listener: (_, state) => _listener(state.status, context),
      child: PrimaryButton(
        expands: false,
        size: ShadButtonSize.sm,
        onPressed: () => context.read<EditTodoCubit>().triggerDeleteTodo(),
        text: AppStrings.confirm,
      ),
    );
  }

  void _listener(EditTodoStatus status, BuildContext context) {
    switch (status) {
      case EditTodoStatus.triggerDeleteTodo:
        context.pop();
        break;
      default:
        break;
    }
  }
}
