import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  void moveNext() {
    if (state.currentPage < state.onboardingPages.length - 1) {
      emit(
        state.copyWith(
          status: OnboardingStatus.moveNext,
          currentPage: state.currentPage + 1,
        ),
      );
    }
  }

  void moveBack() {
    if (state.currentPage > 0) {
      emit(
        state.copyWith(
          status: OnboardingStatus.moveBack,
          currentPage: state.currentPage - 1,
        ),
      );
    }
  }

  @override
  OnboardingState? fromJson(Map<String, dynamic> json) =>
      OnboardingState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OnboardingState state) => state.toJson();
}
