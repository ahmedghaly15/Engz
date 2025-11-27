import '../../models/onboarding.dart';
import 'app_strings.dart';
import 'assets.dart';

class Consts {
  Consts._();

  static const List<Onboarding> onboardingPages = [
    Onboarding(
      imgPath: Assets.imagesOnboarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
    ),
    Onboarding(
      imgPath: Assets.imagesOnboarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
    ),
    Onboarding(
      imgPath: Assets.imagesOnboarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDescription3,
    ),
  ];
}
