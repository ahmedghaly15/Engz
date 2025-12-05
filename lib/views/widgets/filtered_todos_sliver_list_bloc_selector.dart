import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/home/todo_cubit.dart';
import '../../cubits/home/todo_state.dart';
import '../../models/todo.dart';
import 'todo_card.dart';

enum TodoFilter { all, completed }

class FilteredTodosSliverListBlocSelector extends StatelessWidget {
  const FilteredTodosSliverListBlocSelector({
    super.key,
    this.filter = TodoFilter.all,
  });

  final TodoFilter filter;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, List<Todo>>(
      selector: (state) => _filterTodos(state.todos),
      builder: (_, todos) => SliverList.separated(
        itemCount: todos.length,
        itemBuilder: (_, index) => TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 675),
          builder: (context, value, child) => Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          ),
          child: TodoCard(todo: todos[index]),
        ),
        separatorBuilder: (_, _) => SizedBox(height: 16.h),
      ),
    );
  }

  List<Todo> _filterTodos(List<Todo> todos) {
    switch (filter) {
      case TodoFilter.all:
        return todos.where((todo) => !todo.isCompleted).toList();
      case TodoFilter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
    }
  }
}
