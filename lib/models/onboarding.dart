import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.freezed.dart';

@freezed
sealed class Onboarding with _$Onboarding {
  const factory Onboarding({
    required String imgPath,
    required String title,
    required String description,
  }) = _Onboarding;
}
