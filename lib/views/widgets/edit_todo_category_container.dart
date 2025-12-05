import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/theming/app_text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/edit_todo/edit_todo_state.dart';
import '../../cubits/selector/selector_cubit.dart';
import '../../models/todo.dart';
import 'responsive_new_todo_category_grid_view.dart';

class EditTodoCategoryTypeContainer extends StatelessWidget {
  const EditTodoCategoryTypeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showShadCnDialog(
        (_) => BlocProvider<SelectorCubitBase>.value(
          value: context.read<EditTodoCubit>(),
          child: ShadDialog(
            closeIcon: const SizedBox.shrink(),
            title: const Text(AppStrings.chooseCategory),
            child: ResponsiveNewTodoCategoryGridView(
              selectorCubit: context.read<EditTodoCubit>(),
            ),
            actions: [
              PrimaryButton(
                onPressed: () => context.showComingSoonDialog(),
                text: AppStrings.addCategory,
              ),
            ],
          ),
        ),
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
