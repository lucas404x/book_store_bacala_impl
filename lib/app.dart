import 'package:flutter/material.dart';

import 'src/navigation/app_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bacala',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      routerConfig: AppNavigation.instance.routers,
    );
  }
}
