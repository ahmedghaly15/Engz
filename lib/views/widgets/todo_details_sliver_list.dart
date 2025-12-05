import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/utils/app_strings.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../models/todo.dart';
import '../../models/todo_detail.dart';
import 'edit_todo_category_container.dart';
import 'todo_detail_list_tile.dart';

class TodoDetailsSliverList extends StatelessWidget {
  const TodoDetailsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = context.select((EditTodoCubit c) => c.state.todo);
    return SliverList.separated(
      itemCount: _buildDetails(todo!, context).length,
      separatorBuilder: (_, _) => SizedBox(height: 34.h),
      itemBuilder: (_, index) {
        final item = _buildDetails(todo, context)[index];
        return TodoDetailListTile(
          detailIcon: item.detailIcon,
          detailTitle: item.detailTitle,
          detailContent: item.detailContent,
        );
      },
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
