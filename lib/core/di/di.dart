import 'package:get_it/get_it.dart';

import '../../cubits/onboarding/onboarding_cubit.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
}
