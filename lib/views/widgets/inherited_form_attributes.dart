import 'package:flutter/material.dart';

import '../../models/form_attributes.dart';

class InheritedFormAttributes extends InheritedWidget {
  final FormAttributes formAttributes;

  const InheritedFormAttributes({
    super.key,
    required this.formAttributes,
    required super.child,
  });

  static FormAttributes of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedFormAttributes>()!
      .formAttributes;

  @override
  bool updateShouldNotify(covariant InheritedFormAttributes oldWidget) =>
      oldWidget.formAttributes != formAttributes;
}
