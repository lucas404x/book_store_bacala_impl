import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/app_navigation.dart';
import '../../shared/components/app_bottom_navigation_bar.dart';

class BasePage extends StatelessWidget {
  final Widget child;

  const BasePage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    int getCurrentPageIndex(BuildContext context) {
      final GoRouter route = GoRouter.of(context);
      final String location = route.location;

      return Routes.values.indexWhere((value) => value.path == location);
    }

    void onItemTapped(BuildContext context, int index) {
      GoRouter.of(context).go(Routes.values[index].path);
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: getCurrentPageIndex(context),
        onTap: (index) => onItemTapped(context, index),
        navItems: const [
          AppNavItem(iconData: Icons.home, label: 'Home'),
          AppNavItem(iconData: Icons.bookmark, label: 'Bookmark'),
          AppNavItem(iconData: Icons.search, label: 'Search'),
          AppNavItem(iconData: Icons.person, label: 'Profile')
        ],
      ),
    );
  }
}
