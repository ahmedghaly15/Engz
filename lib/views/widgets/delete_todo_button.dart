import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../core/utils/app_strings.dart';

class DeleteTodoButton extends StatelessWidget {
  const DeleteTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      padding: .zero,
      mainAxisAlignment: .start,
      onPressed: () {},
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
