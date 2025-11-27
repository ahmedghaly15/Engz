import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
    this.height = 4,
    this.width = 25,
    this.inactiveWidth,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final bool isActive;
  final double? height, width, inactiveWidth;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      width: (isActive ? width : inactiveWidth ?? width)?.w,
      height: height?.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.all(Radius.circular(56.r)),
        shape: shape,
      ),
    );
  }
}
