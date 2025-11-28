import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home/todo_cubit.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../views/home_view.dart';
import '../../views/onboarding_view.dart';
import '../di/di.dart';
import '../utils/functions/check_if_onboarding_is_visited.dart'
    show isOnboardingVisited;
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return isOnboardingVisited ? _homeRoute() : _onboardingRoute();
      case Routes.home:
        return _homeRoute();
      default:
        return _notFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _onboardingRoute() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<OnboardingCubit>(
        create: (_) => getIt<OnboardingCubit>(),
        child: const OnboardingView(),
      ),
    );
  }

  static MaterialPageRoute<dynamic> _homeRoute() => MaterialPageRoute(
    builder: (_) => BlocProvider<TodoCubit>(
      create: (_) => getIt<TodoCubit>(),
      child: const HomeView(),
    ),
  );

  static MaterialPageRoute<dynamic> _notFoundRoute() => MaterialPageRoute(
    builder: (_) =>
        const Scaffold(body: Center(child: Text('No route defined '))),
  );
}
