import 'package:flutter/material.dart';
import 'package:personal_project/components/goal_list_widget.dart';

import '../theme/color_theme.dart';

class MyGoalsScreen extends StatelessWidget {
  const MyGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Goals',
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: const GoalsListWidget(weekdayFilter: false),
      backgroundColor: ColorTheme.background,
    );
  }
}
