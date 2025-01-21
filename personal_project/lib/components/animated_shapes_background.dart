import 'dart:math';
import 'package:flutter/material.dart';
import 'shape_painter.dart';

class AnimatedShapesBackground extends StatefulWidget {
  const AnimatedShapesBackground({super.key});

  @override
  State<AnimatedShapesBackground> createState() =>
      _AnimatedShapesBackgroundState();
}

class _AnimatedShapesBackgroundState extends State<AnimatedShapesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(10, (index) {
        final random = Random();
        final shapeType = random.nextInt(5); // 0: Star, 1: Triangle, etc.
        final size = random.nextDouble() * 50 + 20; // Random size 20-70
        final color = Colors.primaries[random.nextInt(Colors.primaries.length)]
            .withOpacity(0.5);

        return AnimatedPositioned(
          duration: const Duration(seconds: 5),
          curve: Curves.easeInOut,
          top: random.nextDouble() * MediaQuery.of(context).size.height,
          left: random.nextDouble() * MediaQuery.of(context).size.width,
          child: Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: CustomPaint(
              size: Size(size, size),
              painter: ShapePainter(type: shapeType, color: color),
            ),
          ),
        );
      }),
    );
  }
}
