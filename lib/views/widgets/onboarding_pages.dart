import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_text_styles.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../cubits/onboarding/onboarding_state.dart';
import '../../models/onboarding.dart';
import 'dot_indicator.dart';
import 'onboarding_controller.dart';

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, List<Onboarding>>(
      selector: (state) => state.onboardingPages,
      builder: (context, onboardingPages) {
        final pagesCount = onboardingPages.length;
        return PageView.builder(
          controller: OnboardingController.of(context),
          scrollDirection: .horizontal,
          itemCount: pagesCount,
          onPageChanged: context.read<OnboardingCubit>().onPageChanged,
          itemBuilder: (_, index) {
            final page = onboardingPages[index];
            return _buildOnboardingPage(page, pagesCount);
          },
        );
      },
    );
  }

  Column _buildOnboardingPage(Onboarding page, int pagesCount) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        Image.asset(page.imgPath, fit: BoxFit.cover),
        Container(
          margin: .symmetric(vertical: 50.h),
          child: Row(
            mainAxisAlignment: .center,
            spacing: 8.w,
            children: List.generate(
              pagesCount,
              (index) => DotIndicator(index: index),
              growable: false,
            ),
          ),
        ),
        Container(
          margin: .only(bottom: 40.h),
          child: Text(
            page.title,
            style: AppTextStyles.font32Bold,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          page.description,
          style: AppTextStyles.font16Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
