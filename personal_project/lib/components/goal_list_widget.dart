import 'package:flutter/material.dart';
import 'package:personal_project/components/empty_goals_message_widget.dart';
import 'package:personal_project/components/goal_tile_widget.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:personal_project/respositories/goals_repository.dart';
import 'package:provider/provider.dart';

class GoalsListWidget extends StatefulWidget {
  const GoalsListWidget({super.key, required this.weekdayFilter});

  final bool weekdayFilter;

  @override
  State<GoalsListWidget> createState() => _GoalsListWidgetState();
}

class _GoalsListWidgetState extends State<GoalsListWidget> {
  late GoalsRepository goalsRepository;
  late List<GoalModel> goals;

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final GoalModel goal = goals.removeAt(oldIndex);
      goals.insert(newIndex, goal);
      goalsRepository.updateGoalsOrder(goals);
    });
  }

  @override
  Widget build(BuildContext context) {
    goalsRepository = Provider.of<GoalsRepository>(context);

    if (widget.weekdayFilter) {
      goals = goalsRepository.getGoalsByWeekday(DateTime.now().weekday - 1);
    } else {
      goals = goalsRepository.getGoals();
    }

    if (goals.isEmpty) {
      return const EmptyGoalsMessageWidget();
    }

    return widget.weekdayFilter
        ? ListView.builder(
      padding: const EdgeInsets.all(28),
      itemCount: goals.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GoalTileWidget(
            goal: goals[index],
            isSlidable: !widget.weekdayFilter,
          ),
        );
      },
    )
        : ReorderableListView.builder(
      padding: const EdgeInsets.all(28),
      onReorder: _onReorder,
      itemCount: goals.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          key: ValueKey(goals[index].id),
          padding: const EdgeInsets.only(bottom: 10),
          child: GoalTileWidget(
            goal: goals[index],
            isSlidable: !widget.weekdayFilter,
          ),
        );
      },
    );
  }
}