import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../views/onboarding_view.dart';
import '../di/di.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OnboardingCubit>(
            create: (_) => getIt<OnboardingCubit>(),
            child: const OnboardingView(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
