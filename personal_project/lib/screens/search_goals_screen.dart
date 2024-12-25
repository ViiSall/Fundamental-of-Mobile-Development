import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/components/goal_tile_widget.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:personal_project/respositories/goals_repository.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/theme/color_theme.dart';
import 'package:provider/provider.dart';

class SearchGoalsScreen extends StatefulWidget {
  const SearchGoalsScreen({super.key});

  @override
  State<SearchGoalsScreen> createState() => _SearchGoalsScreenState();
}

class _SearchGoalsScreenState extends State<SearchGoalsScreen> {
  String _searchQuery = '';
  List<GoalModel> _filteredGoals = [];

  void _filterGoals(String query, GoalsRepository goalsRepository) {
    final allGoals = goalsRepository.getGoals();
    setState(() {
      _searchQuery = query;
      _filteredGoals = query.isEmpty
          ? []
          : allGoals
          .where((goal) =>
          goal.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalsRepository = Provider.of<GoalsRepository>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    final backgroundColor = themeProvider.isDarkMode
        ? ColorTheme.darkBackground
        : ColorTheme.lightBackground;
    final textColor = themeProvider.isDarkMode
        ? ColorTheme.white
        : ColorTheme.faded;
    final hintTextColor = themeProvider.isDarkMode
        ? ColorTheme.white.withOpacity(0.7)
        : ColorTheme.faded.withOpacity(0.7);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (query) => _filterGoals(query, goalsRepository),
          autofocus: true,
          style: GoogleFonts.lato(fontSize: 18, color: textColor),
          decoration: InputDecoration(
            hintText: 'Search Goals...',
            hintStyle: GoogleFonts.lato(color: hintTextColor),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode
            ? ColorTheme.darkBackground
            : ColorTheme.secondary,
        iconTheme: IconThemeData(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: _filteredGoals.isEmpty
          ? Center(
            child: Text(_searchQuery.isEmpty
                  ? 'Start typing to search for goals.'
                  : 'No goals found.',
              style: GoogleFonts.lato(fontSize: 18, color: hintTextColor),
            ),
          )
          : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _filteredGoals.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GoalTileWidget(
                  goal: _filteredGoals[index],
                  isSlidable: false,
                ),
              );
        },
      ),
    );
  }
}
