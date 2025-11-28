import '../../cache/cache_helper.dart';
import '../../cache/cache_keys.dart';
import '../../di/di.dart';

bool isOnboardingVisited = false;

Future<void> checkIfOnboardingIsVisited() async {
  final visited = await getIt<CacheHelper>().getBool(CacheKeys.onboarding);
  isOnboardingVisited = visited ?? false;
}
