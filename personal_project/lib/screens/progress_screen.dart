import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:personal_project/providers/theme_provider.dart';
import 'package:personal_project/respositories/days_repository.dart';
import 'package:provider/provider.dart';

import '../theme/color_theme.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key, required this.goal});

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    DaysRepository daysRepository = Provider.of<DaysRepository>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    var days = daysRepository.getDaysByGoalId(goal.id);
    days.sort((dayA, dayB) => dayB.date.compareTo(dayA.date));

    Map<DateTime, int> dates = {};

    int streak = 0;
    int bestStreak = 0;

    if (days.isNotEmpty) {
      List<DateTime> allDates = _getAllDates(days.last.date, days.first.date);

      for (var date in allDates) {
        if (days.indexWhere((element) => element.date == date) != -1) {
          streak += 1;
          dates[date] = 1;
        } else {
          if (streak > bestStreak) {
            bestStreak = streak;
          }
          streak = 0;
        }
      }
      if (streak > bestStreak) {
        bestStreak = streak;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          goal.name,
          style: TextStyle(fontSize: goal.name.length <= 16 ? 32 : 28),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeatMapCalendar(
              showColorTip: false,
              colorsets: const {
                1: ColorTheme.primary,
              },
              datasets: dates,
              fontSize: 14,
              monthFontSize: 18,
              weekFontSize: 12,
              defaultColor: themeProvider.isDarkMode
                  ? ColorTheme.faded.withOpacity(0.5)
                  : ColorTheme.faded,
              textColor: themeProvider.isDarkMode
                  ? ColorTheme.lightBackground
                  : ColorTheme.darkBackground,
              onClick: (date) {
                if (goal.days[date.weekday - 1] &&
                    date.isBefore(DateTime.now())) {
                  daysRepository.updateGoalStatus(
                    date,
                    goal.id,
                  );
                }
              },
            ),
            const SizedBox(height: 50),
            Icon(
              IconData(
                goal.iconId,
                fontFamily: 'MaterialIcons',
              ),
              size: 48,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Streak',
                        style: GoogleFonts.lato(fontSize: 28),
                      ),
                      Text(
                        '$streak days',
                        style: GoogleFonts.lato(
                          fontSize: 28,
                          color: ColorTheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Container(color: themeProvider.isDarkMode ? Colors.grey : ColorTheme.faded, height: 2),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best',
                        style: GoogleFonts.lato(fontSize: 28),
                      ),
                      Text(
                        '$bestStreak days',
                        style: GoogleFonts.lato(fontSize: 28),
                      ),
                    ],
                  ),
                  Container(color: themeProvider.isDarkMode ? Colors.grey : ColorTheme.faded, height: 2),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: themeProvider.backgroundColor,
    );
  }

  List<DateTime> _getAllDates(DateTime firstDate, DateTime lastDate) {
    List<DateTime> allDates = [];

    DateTime today = DateUtils.dateOnly(DateTime.now());
    DateTime date = firstDate;

    while (date.compareTo(today) <= 0) {
      if (goal.days[date.weekday - 1]) {
        allDates.add(date);
      }
      date = date.add(const Duration(days: 1));
    }
    return allDates;
  }
}
