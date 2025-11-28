import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../cubits/onboarding/onboarding_state.dart';
import 'onboarding_controller.dart';

class OnboardingBlocListener extends StatelessWidget {
  const OnboardingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (_, current) => _listenWhen(current.status),
      listener: (_, state) {
        const transitionCurve = Curves.fastEaseInToSlowEaseOut;
        const transitionDuration = Duration(milliseconds: 300);
        switch (state.status) {
          case OnboardingStatus.moveNext:
            OnboardingController.of(
              context,
            ).nextPage(duration: transitionDuration, curve: transitionCurve);
          case OnboardingStatus.moveBack:
            OnboardingController.of(context).previousPage(
              duration: transitionDuration,
              curve: transitionCurve,
            );
          case OnboardingStatus.pageChanged:
            OnboardingController.of(context).animateToPage(
              state.currentPage,
              duration: transitionDuration,
              curve: transitionCurve,
            );
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  bool _listenWhen(OnboardingStatus status) =>
      status.isMoveBack || status.isMoveNext || status.isPageChanged;
}
