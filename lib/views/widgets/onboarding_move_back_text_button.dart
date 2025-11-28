import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadButton;

import '../../core/theming/app_text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';

class OnboardingBackTextButton extends StatelessWidget {
  const OnboardingBackTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.select(
      (OnboardingCubit cubit) => cubit.state.currentPage > 0,
    );
    return ShadButton.ghost(
      enabled: isEnabled,
      child: const Text(AppStrings.back),
      textStyle: AppTextStyles.font16Regular,
      onPressed: isEnabled
          ? () => context.read<OnboardingCubit>().moveBack()
          : null,
    );
  }
}
