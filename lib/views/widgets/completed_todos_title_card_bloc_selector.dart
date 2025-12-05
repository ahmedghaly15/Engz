import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_strings.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/home/todo_state.dart';
import 'todos_title_card.dart';

class CompletedTodosTitleCardBlocSelector extends StatelessWidget {
  const CompletedTodosTitleCardBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, bool>(
      selector: (state) {
        final completedTodos = state.todos.where((todo) => todo.isCompleted);
        return completedTodos.isNotEmpty;
      },
      builder: (context, isTheirCompletedTodos) => isTheirCompletedTodos
          ? SliverPadding(
              padding: .symmetric(vertical: 24.h),
              sliver: const SliverToBoxAdapter(
                child: TodosTitleCard(title: AppStrings.completed),
              ),
            )
          : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}
