import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import 'add_todo_bloc_listener.dart';
import 'add_todo_icon_button_bloc_selector.dart';

class NewTodoActionRow extends StatelessWidget {
  const NewTodoActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        IconButton(
          onPressed: () => context.showDatePicker(
            (dateTime) => context.read<NewTodoCubit>().assignDate(dateTime),
          ),
          icon: const Icon(LucideIcons.calendar),
        ),
        IconButton(
          onPressed: () => context.showCategorySelectorDialog(
            cubit: context.read<NewTodoCubit>(),
          ),
          icon: const Icon(LucideIcons.layoutGrid),
        ),
        IconButton(
          onPressed: () => context.showPriorityDialog(
            cubit: context.read<NewTodoCubit>(),
            constrains: const BoxConstraints(maxWidth: 327, maxHeight: 600),
          ),
          icon: const Icon(LucideIcons.flag),
        ),
        const AddTodoBlocListener(),
        const Spacer(),
        const AddTodoIconButtonBlocSelector(),
      ],
    );
  }
}
