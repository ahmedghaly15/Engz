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
        itemBuilder: (_, index) {
          return TodoCard(todo: todos[index], index: index);
        },
        separatorBuilder: (_, _) => SizedBox(height: 16.h),
      ),
    );
  }

  List<Todo> _filterTodos(List<Todo> todos) {
    switch (filter) {
      case TodoFilter.all:
        return todos;
      case TodoFilter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
    }
  }
}
