import 'package:flutter/material.dart';

import '../../views/onboarding_view.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
