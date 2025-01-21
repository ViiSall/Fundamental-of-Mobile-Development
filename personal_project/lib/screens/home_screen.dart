import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/components/animated_shapes_background.dart';
import 'package:personal_project/components/bouncing_floating_action_button.dart';
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
        elevation: 4,
        backgroundColor: themeProvider.isDarkMode
            ? ColorTheme.darkBackground
            : ColorTheme.secondary,
        title: Text(
          'Today\'s Goals',
          style: GoogleFonts.lato(
            fontSize: 24,
            color: themeProvider.isDarkMode
                ? ColorTheme.secondary
                : ColorTheme.darkBackground,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.accessibility_new, size: 28),
          color: themeProvider.isDarkMode
              ? ColorTheme.secondary
              : ColorTheme.darkBackground,
          onPressed: () => Navigator.pushNamed(context, 'MyGoals'),
        ),
        actions: [
          Row(
            children: [
              Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: themeProvider.isDarkMode
                    ? ColorTheme.secondary
                    : ColorTheme.darkBackground,
              ),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: themeProvider.toggleTheme,
                activeColor: ColorTheme.secondary,
                inactiveThumbColor: ColorTheme.secondary,
                inactiveTrackColor: ColorTheme.faded,
              ),
            ],
          ),
        ],
      ),
      body: const Stack(
        children: [
          GoalsListWidget(weekdayFilter: true),
          AnimatedShapesBackground(),
        ],
      ),
      floatingActionButton: BouncingFloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'ManageGoal'),
        tooltip: 'Add a new goal',
        icon: Icons.add,
        backgroundColor: ColorTheme.secondary,
      ),
    );
  }
}