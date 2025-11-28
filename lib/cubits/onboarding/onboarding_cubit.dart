import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
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

  void onPageChanged(int index) {
    emit(
      state.copyWith(status: OnboardingStatus.pageChanged, currentPage: index),
    );
  }
}
