import 'package:engz/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_strings.dart';
import '../core/widgets/custom_sliver_app_bar.dart';
import '../core/widgets/primary_button.dart';
import '../cubits/edit_todo/edit_todo_cubit.dart';
import '../models/todo.dart';
import 'widgets/delete_todo_button.dart';
import 'widgets/edit_todo_item.dart';
import 'widgets/todo_details_sliver_list.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({super.key, required Todo todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(vertical: 16.h, horizontal: 24.w),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  margin: .only(top: 16.h, bottom: 38.h),
                  child: const EditTodoItem(),
                ),
              ),
              const TodoDetailsSliverList(),
              SliverToBoxAdapter(
                child: Container(
                  margin: .only(top: 29.h),
                  child: const DeleteTodoButton(),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () =>
                          context.pop(context.read<EditTodoCubit>().state.todo),
                      text: '${AppStrings.edit} ${AppStrings.task}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
