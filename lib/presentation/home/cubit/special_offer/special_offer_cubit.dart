import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';

part 'special_offer_state.dart';

class SpecialOfferCubit extends Cubit<SpecialOfferState> {
  SpecialOfferCubit() : super(const SpecialOfferState(0));

  final CarouselSliderController carouselController =
      CarouselSliderController();

  int currentPageIndex = 0;

  void updateCurrentPageIndex(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }
}
