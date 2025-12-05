import 'package:engz/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../core/utils/app_strings.dart';
import '../core/widgets/custom_sliver_app_bar.dart';
import '../core/widgets/primary_button.dart';
import '../cubits/edit_todo/edit_todo_cubit.dart';
import '../models/todo.dart';
import '../models/todo_detail.dart';
import 'widgets/delete_todo_button.dart';
import 'widgets/edit_todo_category_container.dart';
import 'widgets/edit_todo_item.dart';
import 'widgets/todo_detail_list_tile.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({super.key, required Todo todo}) : _todo = todo;

  final Todo _todo;

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
              SliverList.separated(
                itemCount: _buildDetails(_todo, context).length,
                separatorBuilder: (_, _) => SizedBox(height: 34.h),
                itemBuilder: (_, index) {
                  final item = _buildDetails(_todo, context)[index];
                  return TodoDetailListTile(
                    detailIcon: item.detailIcon,
                    detailTitle: item.detailTitle,
                    detailContent: item.detailContent,
                  );
                },
              ),
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

  List<TodoDetailItem> _buildDetails(Todo todo, BuildContext context) {
    return [
      TodoDetailItem(
        detailIcon: LucideIcons.clock12,
        detailTitle: '${AppStrings.task} ${AppStrings.time}',
        detailContent: Text(
          '${DateFormat.MMMd().format(todo.dateTime!)} '
          'at ${DateFormat.jm().format(todo.dateTime!)}',
        ),
      ),
      TodoDetailItem(
        detailIcon: LucideIcons.layoutGrid,
        detailTitle: '${AppStrings.task} ${AppStrings.category}',
        detailContent: const EditTodoCategoryTypeContainer(),
      ),
      TodoDetailItem(
        detailIcon: LucideIcons.flag,
        detailTitle: '${AppStrings.task} ${AppStrings.priority}',
        detailContent: Text('${todo.priority}'),
      ),
    ];
  }
}
