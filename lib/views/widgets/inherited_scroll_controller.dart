import 'package:flutter/material.dart';

class InheritedScrollController extends InheritedWidget {
  final ScrollController scrollController;

  const InheritedScrollController({
    super.key,
    required super.child,
    required this.scrollController,
  });

  static ScrollController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedScrollController>()!
      .scrollController;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
