import 'package:flutter/material.dart';

class InheritedPageController extends InheritedWidget {
  final PageController pageController;

  const InheritedPageController({
    super.key,
    required super.child,
    required this.pageController,
  });

  static PageController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedPageController>()!
      .pageController;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
