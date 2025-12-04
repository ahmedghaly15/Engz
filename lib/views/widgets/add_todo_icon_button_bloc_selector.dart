import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/utils/assets.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';
import '../utils/fade_scale_transition_builder.dart';

class AddTodoIconButtonBlocSelector extends StatelessWidget {
  const AddTodoIconButtonBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<NewTodoCubit, NewTodoState, bool>(
      selector: (state) => state.isSendButtonEnabled,
      builder: (_, isSendButtonEnabled) => IconButton(
        onPressed: isSendButtonEnabled
            ? () => context.read<TodoCubit>().addTodo(
                context.read<NewTodoCubit>().state.todo!,
              )
            : null,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: fadeScaleTransitionBuilder,
          child: SvgPicture.asset(
            key: ValueKey(isSendButtonEnabled),
            isSendButtonEnabled
                ? Assets.svgsPrimarySendIcon
                : Assets.svgsWhiteSendIcon,
          ),
        ),
      ),
    );
  }
}
