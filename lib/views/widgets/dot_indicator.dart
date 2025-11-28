import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_colors.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.index,
    this.height = 4,
    this.width = 25,
    this.inactiveWidth,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final int index;
  final double? height, width, inactiveWidth;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final isActive = context.select<OnboardingCubit, bool>(
      (cubit) => cubit.state.currentPage == index,
    );
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
