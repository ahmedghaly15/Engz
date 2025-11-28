import 'package:flutter/material.dart';

class OnboardingController extends InheritedWidget {
  final PageController pageController;

  const OnboardingController({
    super.key,
    required super.child,
    required this.pageController,
  });

  static PageController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<OnboardingController>()!
      .pageController;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
