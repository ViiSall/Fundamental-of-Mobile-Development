import 'package:flutter/material.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:personal_project/screens/home_screen.dart';
import 'package:personal_project/screens/manage_goal_screen.dart';
import 'package:personal_project/screens/my_goals_screen.dart';
import 'package:personal_project/screens/progress_screen.dart';

class RouteManager {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Home':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const HomeScreen();
          },
        );

      case 'ManageGoal':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return ManageGoalScreen(goal: settings.arguments as GoalModel?);
          },
        );

      case 'MyGoals':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const MyGoalsScreen();
          },
        );

      case 'Progress':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return ProgressScreen(goal: settings.arguments as GoalModel);
          },
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}