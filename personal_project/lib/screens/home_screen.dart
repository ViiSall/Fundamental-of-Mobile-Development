import 'package:flutter/material.dart';
import 'package:personal_project/components/goal_list_widget.dart';
import 'package:personal_project/theme/color_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Today\'s Goals',
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            size: 32,
          ),
          onPressed: () => Navigator.pushNamed(context, 'MyGoals'),
        ),
      ),
      body: const GoalsListWidget(weekdayFilter: true),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'ManageGoal'),
          backgroundColor: ColorTheme.secondary,
          child: const Icon(Icons.add, size: 40),
        ),
      ),
      backgroundColor: ColorTheme.background,
    );
  }
}