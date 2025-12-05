import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../core/utils/assets.dart';
import '../../models/todo.dart';
import 'todo_complete_checkbox.dart';

class EditTodoItem extends StatelessWidget {
  const EditTodoItem({super.key, required Todo todo}) : _todo = todo;

  final Todo _todo;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      backgroundColor: Colors.transparent,
      rowCrossAxisAlignment: .start,
      radius: .all(.circular(4.r)),
      padding: .symmetric(vertical: 12.h, horizontal: 10.w),
      leading: TodoCompleteCheckbox(isCompleted: _todo.isCompleted),
      title: Container(
        margin: .only(bottom: 15.h),
        child: Text(_todo.title!, style: AppTextStyles.font20Regular),
      ),
      description: Text(
        _todo.description!,
        style: AppTextStyles.font16Regular.copyWith(
          color: AppColors.colorAFAFAF,
        ),
        maxLines: null,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(Assets.svgsEditIcon),
      ),
    );
  }
}
