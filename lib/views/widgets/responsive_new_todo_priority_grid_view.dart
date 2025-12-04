import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';

class ResponsiveNewTodoPriorityGridView extends StatelessWidget {
  const ResponsiveNewTodoPriorityGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth;
        // Responsive spacing based on dialog width
        final crossSpacing = dialogWidth * 0.035;
        final mainSpacing = dialogWidth * 0.05;

        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: mainSpacing,
            crossAxisSpacing: crossSpacing,
            childAspectRatio: 1,
          ),
          children: List<int>.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
              .map(
                (priority) => BlocSelector<NewTodoCubit, NewTodoState, int>(
                  selector: (state) => state.todo!.priority,
                  builder: (context, currentPriority) {
                    final isSelected = currentPriority == priority;
                    return GestureDetector(
                      onTap: () =>
                          context.read<NewTodoCubit>().selectPriority(priority),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: .symmetric(horizontal: dialogWidth * 0.02),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.color272727,
                          borderRadius: .circular(4.r),
                        ),
                        child: Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          spacing: 5.h,
                          children: [
                            const Icon(LucideIcons.flag, color: Colors.white),
                            Text(
                              '$priority',
                              style: AppTextStyles.font16Regular,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
