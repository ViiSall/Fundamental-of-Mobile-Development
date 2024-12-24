import 'package:flutter/material.dart';
import 'package:personal_project/providers/app_provider.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/route/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const AppProviders(
      child: HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<  ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: 'Home',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
