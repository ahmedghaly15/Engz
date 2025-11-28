import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.freezed.dart';
part 'onboarding.g.dart';

@freezed
sealed class Onboarding with _$Onboarding {
  const factory Onboarding({
    required String imgPath,
    required String title,
    required String description,
  }) = _Onboarding;

  factory Onboarding.fromJson(Map<String, dynamic> json) =>
      _$OnboardingFromJson(json);
}
