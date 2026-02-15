import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BackgroundPainter(_controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00FF41).withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw animated grid
    for (int i = 0; i < 20; i++) {
      final x = (i * size.width / 20) + (animationValue * 50) % 50;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (int i = 0; i < 40; i++) {
      final y = (i * size.height / 40) + (animationValue * 25) % 25;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw floating particles
    final particlePaint = Paint()
      ..color = const Color(0xFF0099FF).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 15; i++) {
      final x = (math.sin(animationValue * 2 * math.pi + i) * size.width / 4) +
          size.width / 2;
      final y = (math.cos(animationValue * 2 * math.pi + i * 0.5) *
              size.height / 4) +
          size.height / 2;
      canvas.drawCircle(Offset(x, y), 2, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
