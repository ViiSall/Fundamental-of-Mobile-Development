import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_project/components/custom_text_form_field_widget.dart';
import 'package:personal_project/components/icons_carousel_widget.dart';
import 'package:personal_project/components/snackbar_message.dart';
import 'package:personal_project/components/weekday_buttons_widget.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:personal_project/respositories/goals_repository.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../theme/color_theme.dart';

class ManageGoalScreen extends StatelessWidget {
  ManageGoalScreen({super.key, this.goal});

  final GoalModel? goal;

  final nameFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();

  final iconsCarouselWidget = IconsCarouselWidget();
  final weekdayButtonsWidget = WeekdayButtonsWidget();

  void _saveGoal(BuildContext context, var goalsRepository) {
    if (nameFieldController.text.isEmpty) {
      createSnackbarMessage(context, 'Every goal must have a name!');
    } else if (!weekdayButtonsWidget.anySelected()) {
      createSnackbarMessage(context, 'At least one day must be selected.');
    } else {
      goalsRepository.saveGoal(
        GoalModel(
          id: goal != null ? goal!.id : -1,
          name: nameFieldController.text,
          description: descriptionFieldController.text,
          days: weekdayButtonsWidget.getSelectedDays(),
          iconId: iconsCarouselWidget.selectedIcon.codePoint,
        ),
      );
      Navigator.pop(context);
      createSnackbarMessage(context, 'Goal saved!');
    }
  }

  @override
  Widget build(BuildContext context) {
    GoalsRepository goalsRepository = Provider.of<GoalsRepository>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (goal != null) {
      nameFieldController.text = goal!.name;
      descriptionFieldController.text = goal!.description;

      iconsCarouselWidget.selectedIcon =
          IconData(goal!.iconId, fontFamily: 'MaterialIcons');

      weekdayButtonsWidget.setSelectedDays(goal!.days);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          goal == null ? 'New Goal' : 'Edit Goal',
          style: const TextStyle(fontSize: 32),
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18,
              color: ColorTheme.secondary,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _saveGoal(context, goalsRepository),
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 18,
                color: ColorTheme.secondary,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              iconsCarouselWidget,
              const SizedBox(height: 60),
              CustomTextFormFieldWidget(
                controller: nameFieldController,
                maxLength: 24,
                hintText: 'My Goal',
              ),
              const SizedBox(height: 25),
              CustomTextFormFieldWidget(
                controller: descriptionFieldController,
                maxLength: 165,
                maxLines: 5,
                hintText: 'A short description of my goal',
              ),
              const SizedBox(height: 100),
              weekdayButtonsWidget,
            ],
          ),
        ),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
      backgroundColor: themeProvider.backgroundColor
    );
  }
}