import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          AppNavItem(selectIconData: Icons.home, unselectIconData: Icons.home_outlined, label: 'Home'),
          AppNavItem(selectIconData: Icons.bookmark, unselectIconData: Icons.bookmark_outline, label: 'Bookmark'),
          AppNavItem(selectIconData: CupertinoIcons.search, unselectIconData: CupertinoIcons.search, label: 'Search'),
          AppNavItem(selectIconData: CupertinoIcons.person_fill, unselectIconData: CupertinoIcons.person, label: 'Profile')
        ],
      ),
    );
  }
}
