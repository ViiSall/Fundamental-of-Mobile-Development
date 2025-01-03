import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyGoalsMessageWidget extends StatelessWidget {
  const EmptyGoalsMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 120, 40, 60),
        child: Column(
          children: [
            Image.asset(
              'assets/images/spooky_ghost.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 50),
            Text(
              'Oooooops!',
              style: GoogleFonts.lato(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'This place looks empty, let\'s create some goals before more ghosts arrive!',
              style: GoogleFonts.lato(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}