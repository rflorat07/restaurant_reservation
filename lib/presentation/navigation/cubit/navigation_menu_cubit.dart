import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_menu_state.dart';

class NavigationMenuCubit extends Cubit<NavigationMenuState> {
  NavigationMenuCubit() : super(const NavigationMenuInitial());

  void changePage(int index) {
    emit(NavigationMenuChanged(index));
  }
}
