import 'package:flutter/material.dart';

class BouncingFloatingActionButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String tooltip;
  final IconData icon;
  final Color backgroundColor;

  const BouncingFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.tooltip,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  State<BouncingFloatingActionButton> createState() =>
      _BouncingFloatingActionButtonState();
}

class _BouncingFloatingActionButtonState
    extends State<BouncingFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _animation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: widget.backgroundColor,
          tooltip: widget.tooltip,
          child: Icon(widget.icon, size: 42),
        ),
      ),
    );
  }
}
