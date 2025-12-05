import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../widgets/coming_soon_shad_dialog.dart';

extension NavigationExtensions<T> on BuildContext {
  Future<T?> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed<T>(this, routeName, arguments: arguments);

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

extension ShadThemeAccess on BuildContext {
  ShadThemeData get shadTheme => ShadTheme.of(this);
  ShadTextTheme get shadTextTheme => shadTheme.textTheme;
}

extension ShowDatePicker on BuildContext {
  Future<DateTime?> showDatePicker(void Function(DateTime?)? onChanged) =>
      showDialog<DateTime?>(
        context: this,
        builder: (_) => Align(
          alignment: Alignment.center,
          child: ShadCalendar(onChanged: onChanged),
        ),
      );
}

extension CapitalizeString on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

extension ShowShadDialog<T> on BuildContext {
  Future<T?> showShadCnDialog(Widget Function(BuildContext) builder) =>
      showShadDialog(useRootNavigator: true, context: this, builder: builder);
}

extension ComingSoonDialog on BuildContext {
  void showComingSoonDialog() =>
      showShadCnDialog((_) => const ComingSoonShadDialog());
}
