import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.leading,
    this.onPressed,
    this.expands = true,
    this.size,
    this.decoration,
    this.backgroundColor,
  });

  final String? text;
  final Widget? child, leading;
  final VoidCallback? onPressed;
  final bool? expands;
  final ShadButtonSize? size;
  final ShadDecoration? decoration;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      size: size,
      backgroundColor: backgroundColor,
      pressedBackgroundColor: backgroundColor?.withAlpha(102),
      decoration: decoration,
      onPressed: onPressed,
      leading: leading,
      expands: expands,
      padding: .symmetric(vertical: 12.h, horizontal: 16.w),
      child: child ?? Text(text!, style: AppTextStyles.font16Regular),
    );
  }
}
