part of 'onboarding_cubit.dart';

enum OnBoardingStatus { initial, completed }

class OnboardingState extends Equatable {
  const OnboardingState({required this.status, required this.currentPageIndex});

  final int currentPageIndex;
  final OnBoardingStatus status;

  @override
  List<Object> get props => [currentPageIndex, status];

  OnboardingState copyWith({OnBoardingStatus? status, int? currentPageIndex}) {
    return OnboardingState(
      status: status ?? this.status,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
