import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/router/routes.dart';
import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../models/todo.dart';
import 'todo_complete_checkbox.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required Todo todo}) : _todo = todo;

  final Todo _todo;

  @override
  Widget build(BuildContext context) {
    final radius = 4.r;
    return InkWell(
      onTap: () => context.pushNamed(Routes.editTodo, arguments: _todo),
      borderRadius: .all(.circular(radius)),
      child: ShadCard(
        rowCrossAxisAlignment: .center,
        backgroundColor: AppColors.color363636,
        radius: .all(.circular(radius)),
        padding: .symmetric(vertical: 12.h, horizontal: 10.w),
        leading: TodoCompleteCheckbox(
          isCompleted: _todo.isCompleted,
          id: _todo.id,
        ),
        title: Text(_todo.title!, style: AppTextStyles.font16Regular),
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
            '${DateFormat.MMMd().format(_todo.dateTime!)} at ${DateFormat.jm().format(_todo.dateTime!)}',
            style: AppTextStyles.font12Regular.copyWith(
              color: AppColors.colorAFAFAF,
            ),
          ),
        ),
        Container(
          padding: .symmetric(vertical: 4.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: _todo.category!.color,
            borderRadius: .circular(radius),
          ),
          child: Row(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            spacing: 8.w,
            children: [
              SvgPicture.asset(
                _todo.category!.iconPath,
                width: 14.h,
                height: 14.h,
              ),
              Text(
                _todo.category!.typeName,
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
              Text('${_todo.priority}', style: AppTextStyles.font12Regular),
            ],
          ),
        ),
      ],
    );
  }
}
