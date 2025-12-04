import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';

class ShowNewTodoDatePickerIconButton extends StatelessWidget {
  const ShowNewTodoDatePickerIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.showDatePicker(
        (dateTime) => context.read<NewTodoCubit>().assignDate(dateTime),
      ),
      icon: const Icon(LucideIcons.calendar),
    );
  }
}
