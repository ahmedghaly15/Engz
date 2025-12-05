import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_text_styles.dart';
import '../../cubits/new_todo/new_todo_cubit.dart';
import '../../cubits/new_todo/new_todo_state.dart';
import '../../models/todo.dart' show CategoryType, CategoryExtension;

class ResponsiveNewTodoCategoryGridView extends StatelessWidget {
  const ResponsiveNewTodoCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth;

        // Responsive spacing based on dialog width
        final crossSpacing = dialogWidth * 0.02;
        final mainSpacing = dialogWidth * 0.05;

        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: mainSpacing,
            crossAxisSpacing: crossSpacing,
            childAspectRatio: 1,
          ),
          children: CategoryType.values
              .map(
                (type) => GestureDetector(
                  onTap: () =>
                      context.read<NewTodoCubit>().selectCategory(type),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .center,
                    spacing: 6.h,
                    children: [
                      Flexible(
                        child: BlocSelector<NewTodoCubit, NewTodoState, bool>(
                          selector: (state) => state.todo!.category == type,
                          builder: (context, isSelected) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: .all(dialogWidth * 0.08),
                            decoration: BoxDecoration(
                              color: type.color,
                              borderRadius: .circular(6.r),
                              border: isSelected
                                  ? Border.all(
                                      color: Colors.white,
                                      width: 2.5.w,
                                    )
                                  : null,
                            ),
                            child: SvgPicture.asset(
                              type.iconPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Text(type.typeName, style: AppTextStyles.font12Regular),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
