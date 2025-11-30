import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';

class EmptyTodos extends StatelessWidget {
  const EmptyTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      spacing: 10.h,
      children: [
        Image.asset(Assets.imagesEmptyTodos, fit: BoxFit.cover),
        SizedBox(height: 8.h),
        FittedBox(
          child: Text(
            AppStrings.emptyTodosTitle,
            style: AppTextStyles.font20Regular,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          AppStrings.emptyTodosDescription,
          style: AppTextStyles.font12Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
