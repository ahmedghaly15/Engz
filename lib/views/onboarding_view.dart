import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/onboarding_bloc_listener.dart';
import 'widgets/inherited_page_controller.dart';
import 'widgets/onboarding_move_back_text_button.dart';
import 'widgets/onboarding_move_next_button.dart';
import 'widgets/onboarding_pages.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedPageController(
      pageController: _pageController,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: .symmetric(horizontal: 32.w, vertical: 24.h),
            child: const Column(
              crossAxisAlignment: .center,
              children: [
                OnboardingBlocListener(),
                Expanded(child: OnboardingPages()),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    OnboardingBackTextButton(),
                    OnboardingMoveNextButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
