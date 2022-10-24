import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/navigation/app_navigation.dart';
import 'src/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp.router(
      title: 'Bacala',
      theme: theme.copyWith(
        primaryColor: AppTheme.primaryColor,
        backgroundColor: AppTheme.backgroundColor,
        scaffoldBackgroundColor: AppTheme.backgroundColor,
        textTheme: GoogleFonts.workSansTextTheme(),
        colorScheme: theme.colorScheme.copyWith(
          primary: AppTheme.primaryColor,
          secondary: AppTheme.primaryColor
        )
      ),
      routerConfig: AppNavigation.instance.routers,
    );
  }
}
