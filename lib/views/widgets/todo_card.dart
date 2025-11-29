import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../models/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo, required this.index});

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    final radius = 4.r;
    return InkWell(
      onTap: () {},
      borderRadius: .all(.circular(radius)),
      child: ShadCard(
        rowCrossAxisAlignment: .center,
        backgroundColor: AppColors.color363636,
        radius: .all(.circular(radius)),
        padding: .symmetric(vertical: 12.h, horizontal: 10.w),
        leading: Container(
          margin: EdgeInsetsDirectional.only(end: 16.w),
          child: ShadCheckbox(
            value: todo.isCompleted!,
            decoration: ShadDecoration(
              shape: BoxShape.circle,
              border: ShadBorder.all(
                width: 1.5.w,
                color: Colors.white.withAlpha((0.87 * 255).round()),
              ),
            ),
            onChanged: (_) => context.read<TodoCubit>().completeTodo(index),
          ),
        ),
        title: Text(todo.title!, style: AppTextStyles.font16Regular),
        description: Row(
          mainAxisAlignment: .spaceBetween,
          spacing: 12.w,
          children: [
            Text(
              '${DateFormat.MMMd().format(todo.dateTime!)} at ${DateFormat.jm().format(todo.dateTime!)}',
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.colorAFAFAF,
              ),
            ),
            Container(
              padding: .all(8.h),
              decoration: BoxDecoration(
                border: .all(color: AppColors.primary, width: 1.w),
              ),
              child: Row(
                spacing: 5.w,
                children: [
                  const Icon(LucideIcons.flag, color: AppColors.primary),
                  Text('${todo.priority}', style: AppTextStyles.font12Regular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
