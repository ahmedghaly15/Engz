import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../core/theming/app_text_styles.dart';
import '../core/utils/app_strings.dart';
import '../core/widgets/primary_button.dart';
import 'widgets/onboarding_pages.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 32.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              const Expanded(child: OnboardingPages()),
              // const Spacer(),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ShadButton.ghost(
                    child: const Text(AppStrings.back),
                    textStyle: AppTextStyles.font16Regular,
                  ),
                  PrimaryButton(
                    expands: false,
                    onPressed: () {},
                    text: AppStrings.next,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
