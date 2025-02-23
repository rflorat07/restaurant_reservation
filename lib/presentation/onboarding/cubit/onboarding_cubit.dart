import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
    : super(
        const OnboardingState(
          currentPageIndex: 0,
          status: OnBoardingStatus.initial,
        ),
      );

  final PageController pageController = PageController();

  void updatePageIndicator(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }

  void dotNavigationClick(int index) {
    if (pageController.hasClients) {
      animateToPage(index);
    }
  }

  void nextPage() {
    if (state.currentPageIndex == 2) {
      emit(state.copyWith(status: OnBoardingStatus.completed));
    } else {
      final currentPageIndex = state.currentPageIndex + 1;
      animateToPage(currentPageIndex);
    }
  }

  void backPage() {
    if (state.currentPageIndex != 0) {
      final currentPageIndex = state.currentPageIndex - 1;
      animateToPage(currentPageIndex);
    }
  }

  void animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(state.copyWith(currentPageIndex: index));
  }
}
