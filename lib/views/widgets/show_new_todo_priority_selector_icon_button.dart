import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import 'responsive_new_todo_priority_grid_view.dart';

class ShowNewTodoPrioritySelectorIconButton extends StatelessWidget {
  const ShowNewTodoPrioritySelectorIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.showShadCnDialog(
        (_) => BlocProvider<NewTodoCubit>.value(
          value: context.read<NewTodoCubit>(),
          child: const ShadDialog(
            constraints: BoxConstraints(maxWidth: 327, maxHeight: 600),
            title: Text(AppStrings.taskPriority),
            child: ResponsiveNewTodoPriorityGridView(),
          ),
        ),
      ),
      icon: const Icon(LucideIcons.flag),
    );
  }
}
