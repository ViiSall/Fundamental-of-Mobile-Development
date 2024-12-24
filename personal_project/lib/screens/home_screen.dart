import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/components/goal_list_widget.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/theme/color_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today\'s Goals',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.accessibility_new,
            size: 32,
            color: ColorTheme.secondary,
          ),
          onPressed: () => Navigator.pushNamed(context, 'MyGoals'),
        ),
        actions: [
          Row(
            children: [
              Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: themeProvider.isDarkMode ? ColorTheme.secondary : ColorTheme.secondary,
              ),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ],
          ),
        ],
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
      backgroundColor: themeProvider.backgroundColor,
    );
  }
}
