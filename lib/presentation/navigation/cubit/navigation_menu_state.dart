part of 'navigation_menu_cubit.dart';

sealed class NavigationMenuState extends Equatable {
  const NavigationMenuState(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class NavigationMenuInitial extends NavigationMenuState {
  const NavigationMenuInitial() : super(0);
}

class NavigationMenuChanged extends NavigationMenuState {
  const NavigationMenuChanged(super.index);
}
