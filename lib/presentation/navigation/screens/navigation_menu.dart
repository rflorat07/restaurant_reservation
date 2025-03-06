import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../presentation.dart';
import '../widgets/navigation_destination.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationMenuCubit, NavigationMenuState>(
        builder: (context, state) {
          return screens[state.index];
        },
      ),
      bottomNavigationBar:
          BlocBuilder<NavigationMenuCubit, NavigationMenuState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.borderPrimary),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(TSizes.size20),
                    topLeft: Radius.circular(TSizes.size20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(TSizes.size16),
                  ),
                  child: NavigationBar(
                    selectedIndex: state.index,
                    onDestinationSelected:
                        (value) => context
                            .read<NavigationMenuCubit>()
                            .changePage(value),
                    destinations: const [
                      // Home Tab
                      TNavigationDestination(
                        label: TTexts.homeTab,
                        icon: TIcons.iconHomeTab,
                        selectedIcon: TIcons.iconHomeTabSelected,
                      ),

                      // Discover Tab
                      TNavigationDestination(
                        label: TTexts.discoverTab,
                        icon: TIcons.iconExploreTab,
                        selectedIcon: TIcons.iconExploreTabSelected,
                      ),

                      // Wishlist Tab
                      TNavigationDestination(
                        label: TTexts.wishlistTab,
                        icon: TIcons.iconBookmarkTab,
                        selectedIcon: TIcons.iconBookmarkTabSelected,
                      ),

                      // Profile Tab
                      TNavigationDestination(
                        label: TTexts.profileTab,
                        icon: TIcons.iconProfileTab,
                        selectedIcon: TIcons.iconProfileTabSelected,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
