import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../helpers/extensions.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.actions,
    this.titleWidget,
    this.leading,
    this.backgroundColor,
    this.centerTitle = true,
  });

  final String? titleText;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Widget? leading;
  final Color? backgroundColor;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const PopIconButton(),
      backgroundColor: backgroundColor,
      title: (titleText == null && titleWidget == null)
          ? null
          : titleWidget ?? Text(titleText!, style: AppTextStyles.font16Regular),
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}

class PopIconButton extends StatelessWidget {
  const PopIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.color1D1D1D,
        borderRadius: .circular(4.r),
      ),
      child: InkWell(
        onTap: () => context.pop(),
        child: const Icon(LucideIcons.x, color: Colors.white),
      ),
    );
  }
}
