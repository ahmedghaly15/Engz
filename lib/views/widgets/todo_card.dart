import 'package:engz/models/category.dart';
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
        leading: _completeTodoCheckbox(context),
        title: Text(todo.title!, style: AppTextStyles.font16Regular),
        description: _dateAndCategoryAndPriority(radius),
      ),
    );
  }

  Row _dateAndCategoryAndPriority(double radius) {
    return Row(
      spacing: 12.w,
      children: [
        Expanded(
          child: Text(
            '${DateFormat.MMMd().format(todo.dateTime!)} at ${DateFormat.jm().format(todo.dateTime!)}',
            style: AppTextStyles.font12Regular.copyWith(
              color: AppColors.colorAFAFAF,
            ),
          ),
        ),
        Container(
          padding: .symmetric(vertical: 4.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: todo.category!.color,
            borderRadius: .circular(radius),
          ),
          child: Row(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            spacing: 8.w,
            children: [
              SvgPicture.asset(
                todo.category!.iconPath,
                width: 14.h,
                height: 14.h,
              ),
              Text(
                todo.category!.typeName,
                style: AppTextStyles.font12Regular.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: .all(8.h),
          decoration: BoxDecoration(
            borderRadius: .circular(radius),
            border: .all(color: AppColors.primary, width: 1.w),
          ),
          child: Row(
            spacing: 5.w,
            children: [
              Icon(LucideIcons.flag, color: Colors.white, size: 14.h),
              Text('${todo.priority}', style: AppTextStyles.font12Regular),
            ],
          ),
        ),
      ],
    );
  }

  Container _completeTodoCheckbox(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16.w),
      child: ShadCheckbox(
        value: todo.isCompleted,
        decoration: ShadDecoration(
          shape: BoxShape.circle,
          border: ShadBorder.all(
            width: 1.5.w,
            color: Colors.white.withAlpha((0.87 * 255).round()),
          ),
        ),
        onChanged: (_) => context.read<TodoCubit>().toggleCompleteTodo(todo.id),
      ),
    );
  }
}
