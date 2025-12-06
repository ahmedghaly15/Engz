import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/helpers/extensions.dart';
import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/cancel_text_button.dart';
import '../../cubits/edit_todo/edit_todo_cubit.dart';
import 'confirm_delete_todo_bloc_listener.dart';

class DeleteTodoButton extends StatelessWidget {
  const DeleteTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      padding: .zero,
      mainAxisAlignment: .start,
      onPressed: () => context.showShadCnDialog(
        (_) => BlocProvider<EditTodoCubit>.value(
          value: context.read<EditTodoCubit>(),
          child: ShadDialog.alert(
            closeIcon: const SizedBox.shrink(),
            title: const Text('${AppStrings.delete} ${AppStrings.task}'),
            description: Container(
              margin: .only(bottom: 16.h),
              child: const Text(AppStrings.sureToDelete),
            ),
            actions: const [
              Expanded(child: CancelTextButton(size: ShadButtonSize.sm)),
              Expanded(child: ConfirmDeleteTodoBlocListener()),
            ],
          ),
        ),
      ),
      gap: 11.w,
      leading: const Icon(LucideIcons.trash2, color: AppColors.colorFF4949),
      child: Text(
        '${AppStrings.delete} ${AppStrings.task}',
        style: AppTextStyles.font16Regular.copyWith(
          color: AppColors.colorFF4949,
        ),
      ),
    );
  }
}
