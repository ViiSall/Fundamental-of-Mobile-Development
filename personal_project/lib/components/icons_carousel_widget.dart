import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/theme/color_theme.dart';

class IconsCarouselWidget extends StatefulWidget {
  IconsCarouselWidget({super.key});

  IconData selectedIcon = Icons.auto_awesome;

  @override
  State<IconsCarouselWidget> createState() => _IconsCarouselWidgetState();
}

class _IconsCarouselWidgetState extends State<IconsCarouselWidget> {
  final List<IconData> icons = const [
    Icons.auto_awesome,
    Icons.school,
    Icons.favorite_rounded,
    Icons.rocket_launch_rounded,
    Icons.restaurant,
    Icons.music_note,
    Icons.pets,
    Icons.gamepad_rounded,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: icons.length,
      itemBuilder: (context, index, realIndex) => Icon(
        icons[index],
        size: index == _currentIndex ? 70 : 50,
        color: index == _currentIndex ? ColorTheme.primary : ColorTheme.secondary,
      ),
      options: CarouselOptions(
        initialPage: icons.indexOf(widget.selectedIcon),
        height: 70,
        viewportFraction: 0.25,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
            widget.selectedIcon = icons[index];
          });
        },
      ),
    );
  }
}
