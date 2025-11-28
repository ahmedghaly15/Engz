import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../models/onboarding.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

enum OnboardingStatus { initial, moveNext, moveBack }

extension OnboardingStatusX on OnboardingStatus {
  bool get isInitial => this == OnboardingStatus.initial;
  bool get isMoveNext => this == OnboardingStatus.moveNext;
  bool get isMoveBack => this == OnboardingStatus.moveBack;
}

const List<Onboarding> _onboardingPages = [
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

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStatus.initial) OnboardingStatus status,
    @Default(0) int currentPage,
    @Default(_onboardingPages) List<Onboarding> onboardingPages,
  }) = _OnboardingState;

  factory OnboardingState.initial() => OnboardingState();
  factory OnboardingState.fromJson(Map<String, Object?> json) =>
      _$OnboardingStateFromJson(json);
}
