import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/components/goal_list_widget.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/theme/color_theme.dart';
import 'package:provider/provider.dart';

class MyGoalsScreen extends StatelessWidget {
  const MyGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Goals',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: ColorTheme.secondary,size: 28,),
            onPressed: () => Navigator.pushNamed(context, 'Search'),
          ),
        ],
      ),
      body: const GoalsListWidget(weekdayFilter: false),
      backgroundColor: themeProvider.backgroundColor,
    );
  }
}
