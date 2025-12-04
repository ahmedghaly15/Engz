import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_text_styles.dart';
import '../../models/category.dart';

class ResponsiveCategoriesGridView extends StatelessWidget {
  const ResponsiveCategoriesGridView({super.key});

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
                (category) => Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .center,
                  spacing: 6.h,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(dialogWidth * 0.08),
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: .circular(6.r),
                        ),
                        child: SvgPicture.asset(
                          category.iconPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(category.typeName, style: AppTextStyles.font12Regular),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
