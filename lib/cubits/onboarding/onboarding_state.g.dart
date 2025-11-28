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
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      onboardingPages:
          (json['onboardingPages'] as List<dynamic>?)
              ?.map((e) => Onboarding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          _onboardingPages,
    );

Map<String, dynamic> _$OnboardingStateToJson(_OnboardingState instance) =>
    <String, dynamic>{
      'status': _$OnboardingStatusEnumMap[instance.status]!,
      'currentPage': instance.currentPage,
      'onboardingPages': instance.onboardingPages,
    };

const _$OnboardingStatusEnumMap = {
  OnboardingStatus.initial: 'initial',
  OnboardingStatus.moveNext: 'moveNext',
  OnboardingStatus.moveBack: 'moveBack',
};
