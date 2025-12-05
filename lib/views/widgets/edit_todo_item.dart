import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../core/utils/assets.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';
import '../../models/todo.dart';
import 'edit_todo_content_shad_dialog.dart';
import 'todo_complete_checkbox.dart';

class EditTodoItem extends StatelessWidget {
  const EditTodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditTodoCubit, EditTodoState, Todo>(
      selector: (state) => state.todo!,
      builder: (context, todo) => ShadCard(
        backgroundColor: Colors.transparent,
        rowCrossAxisAlignment: .start,
        padding: .zero,
        leading: TodoCompleteCheckbox(isCompleted: todo.isCompleted),
        title: Container(
          margin: .only(bottom: 15.h),
          alignment: AlignmentDirectional.topStart,
          child: Text(todo.title!, style: AppTextStyles.font20Regular),
        ),
        description: Text(
          todo.description!,
          style: AppTextStyles.font16Regular.copyWith(
            color: AppColors.colorAFAFAF,
          ),
          maxLines: null,
        ),
        trailing: IconButton(
          padding: .zero,
          alignment: AlignmentDirectional.topEnd,
          onPressed: () => context.showShadCnDialog(
            (_) => BlocProvider<EditTodoCubit>.value(
              value: context.read<EditTodoCubit>(),
              child: EditTodoContentShadDialog(todo: todo),
            ),
          ),
          icon: SvgPicture.asset(Assets.svgsEditIcon),
        ),
      ),
    );
  }
}
