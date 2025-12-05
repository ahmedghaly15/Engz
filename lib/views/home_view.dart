import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/home/todo_cubit.dart';
import '../cubits/home/todo_state.dart';
import 'widgets/add_todo_fab.dart';
import 'widgets/empty_todos.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(vertical: 16.h, horizontal: 24.w),
          child: BlocSelector<TodoCubit, TodoState, bool>(
            selector: (state) => state.todos.isNotEmpty,
            builder: (context, isNotEmpty) => isNotEmpty
                ? const HomeViewBody()
                : Padding(
                    padding: .symmetric(horizontal: 40.w),
                    child: const EmptyTodos(),
                  ),
          ),
        ),
      ),
      floatingActionButton: const AddTodoFAB(),
    );
  }
}
