import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension NavigationExtensions on BuildContext {
  void pushNamed(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void pop([dynamic result]) {
    Navigator.pop(this, result);
  }

  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  void popAndPushNamed(String routeName) {
    Navigator.popAndPushNamed(this, routeName);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void popTop() => Navigator.of(this, rootNavigator: true).pop();
}

extension NullStringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension ShowShadSheet<T> on BuildContext {
  Future<T?> showSheet({
    Widget? title,
    Widget? description,
    Widget? child,
    List<Widget> actions = const [],
    String? titleText,
    String? descriptionText,
  }) => showShadSheet(
    context: this,
    side: ShadSheetSide.bottom,
    isDismissible: true,
    useRootNavigator: true,
    builder: (_) => ShadSheet(
      closeIcon: const SizedBox.shrink(),
      child: child,
      title: title ?? (titleText != null ? Text(titleText) : null),
      description:
          description ??
          (descriptionText != null ? Text(descriptionText) : null),
      actions: actions,
    ),
  );
}
