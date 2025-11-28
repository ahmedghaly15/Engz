import 'package:flutter/material.dart';

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
