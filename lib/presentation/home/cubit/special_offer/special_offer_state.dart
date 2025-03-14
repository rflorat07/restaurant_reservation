part of 'special_offer_cubit.dart';

class SpecialOfferState extends Equatable {
  const SpecialOfferState(this.currentPageIndex);

  final int currentPageIndex;

  @override
  List<Object> get props => [currentPageIndex];

  SpecialOfferState copyWith({int? currentPageIndex}) {
    return SpecialOfferState(currentPageIndex ?? this.currentPageIndex);
  }
}
