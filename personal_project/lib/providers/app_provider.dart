import 'package:flutter/material.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/respositories/days_repository.dart';
import 'package:personal_project/respositories/goals_repository.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoalsRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => DaysRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: child,
    );
  }
}
