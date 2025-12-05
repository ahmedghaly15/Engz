import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_colors.dart';
import '../../core/theming/app_text_styles.dart';
import '../../cubits/selector/selector_cubit.dart';

class ResponsiveNewTodoPriorityGridView extends StatelessWidget {
  const ResponsiveNewTodoPriorityGridView({
    super.key,
    required SelectorCubitBase selectorCubit,
  }) : _selectorCubit = selectorCubit;

  final SelectorCubitBase _selectorCubit;

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
                (priority) => BlocSelector<SelectorCubitBase, dynamic, bool>(
                  selector: (state) =>
                      _selectorCubit.selectedPriority == priority,
                  builder: (context, isSelected) => GestureDetector(
                    onTap: () => _selectorCubit.selectPriority(priority),
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
                          Text('$priority', style: AppTextStyles.font16Regular),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
