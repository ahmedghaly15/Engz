// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) =>
    _OnboardingState(
      status:
          $enumDecodeNullable(_$OnboardingStatusEnumMap, json['status']) ??
          OnboardingStatus.initial,
      onboardingPages:
          (json['onboardingPages'] as List<dynamic>?)
              ?.map((e) => Onboarding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OnboardingStateToJson(
  _OnboardingState instance,
) => <String, dynamic>{
  'status': _$OnboardingStatusEnumMap[instance.status]!,
  'onboardingPages': instance.onboardingPages.map((e) => e.toJson()).toList(),
};

const _$OnboardingStatusEnumMap = {
  OnboardingStatus.initial: 'initial',
  OnboardingStatus.moveNext: 'moveNext',
  OnboardingStatus.moveBack: 'moveBack',
  OnboardingStatus.pageChanged: 'pageChanged',
};
