import 'package:bacala/src/pages/base/base_page.dart';
import 'package:bacala/src/pages/bookmark/bookmark_page.dart';
import 'package:bacala/src/pages/home/home_page.dart';
import 'package:bacala/src/pages/profile/profile_page.dart';
import 'package:bacala/src/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home('/home'),
  bookmark('/bookmark'),
  search('/search'),
  profile('/profile');

  const Routes(this.path);

  final String path;
}

class AppNavigation {
  AppNavigation._();

  static final AppNavigation instance = AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  final GoRouter routers = GoRouter(
    initialLocation: Routes.home.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => BasePage(child: child),
        routes: [
          GoRoute(
            path: Routes.home.path,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: Routes.bookmark.path,
            builder: (context, state) => const BookmarkPage(),
          ),
          GoRoute(
            path: Routes.search.path,
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: Routes.profile.path,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
