import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../core/di/di.dart';
import '../../core/helpers/extensions.dart';
import '../../core/utils/app_strings.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import 'add_todo_sheet_content.dart';

class AddTodoFAB extends StatelessWidget {
  const AddTodoFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.showSheet(
        titleText: AppStrings.addTask,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NewTodoCubit>(create: (_) => getIt<NewTodoCubit>()),
            BlocProvider<TodoCubit>.value(value: context.read<TodoCubit>()),
          ],
          child: const AddTodoSheetContent(),
        ),
      ),
      child: const Icon(LucideIcons.plus),
    );
  }
}
