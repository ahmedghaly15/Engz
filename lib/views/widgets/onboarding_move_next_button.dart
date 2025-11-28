import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../core/widgets/primary_button.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';

class OnboardingMoveNextButton extends StatelessWidget {
  const OnboardingMoveNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLastPage = context.select(
      (OnboardingCubit cubit) =>
          cubit.state.currentPage == cubit.state.onboardingPages.length - 1,
    );
    return PrimaryButton(
      expands: false,
      onPressed: isLastPage
          ? () {}
          : () => context.read<OnboardingCubit>().moveNext(),
      text: isLastPage ? AppStrings.getStarted : AppStrings.next,
    );
  }
}
