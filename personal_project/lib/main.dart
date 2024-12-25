import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/api/firebase_api.dart';
import 'package:personal_project/providers/app_provider.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/route/route_manager.dart';
import 'package:personal_project/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'api/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
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
      initialRoute: 'Splash',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
