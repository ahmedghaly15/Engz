import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/edit_todo/edit_todo_cubit.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../models/todo.dart';
import '../../views/edit_todo_view.dart';
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
      case Routes.editTodo:
        final args = settings.arguments as Todo;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EditTodoCubit>(
            create: (_) => getIt<EditTodoCubit>()..initTodo(args),
            child: EditTodoView(todo: args),
          ),
        );
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
