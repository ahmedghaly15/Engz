import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/theming/app_text_styles.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';
import '../../models/todo.dart';

class EditTodoCategoryTypeContainer extends StatelessWidget {
  const EditTodoCategoryTypeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showCategorySelectorDialog(
        cubit: context.read<EditTodoCubit>(),
      ),
      child: BlocSelector<EditTodoCubit, EditTodoState, CategoryType>(
        selector: (state) => state.todo!.category!,
        builder: (context, category) => Row(
          spacing: 8.w,
          children: [
            SvgPicture.asset(category.iconPath),
            Text(category.typeName, style: AppTextStyles.font12Regular),
          ],
        ),
      ),
    );
  }
}
