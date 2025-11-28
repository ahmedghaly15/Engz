import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cubits/onboarding/onboarding_cubit.dart';
import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  await _registerExternals();
  _registerCore();
  _registerCubits();
}

void _registerCore() {
  getIt.registerLazySingleton<CacheHelper>(
    () => SharedPrefHelper(getIt<SharedPreferences>()),
  );
}

Future<void> _registerExternals() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
}

void _registerCubits() {
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
}
