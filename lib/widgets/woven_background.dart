import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/colors.dart';

// Premium 3D-style woven network background
// Slowly animated, organic, architectural, minimal
class WovenNetworkBackground extends StatefulWidget {
  final Widget child;
  
  const WovenNetworkBackground({super.key, required this.child});

  @override
  State<WovenNetworkBackground> createState() => _WovenNetworkBackgroundState();
}

class _WovenNetworkBackgroundState extends State<WovenNetworkBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60), // Very slow rotation
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
    return Stack(
      children: [
        // Pure black background
        Container(color: AppColors.background),
        
        // Animated woven structure
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: WovenStructurePainter(
                animationValue: _controller.value,
              ),
              size: Size.infinite,
            );
          },
        ),
        
        // Content on top
        widget.child,
      ],
    );
  }
}

class WovenStructurePainter extends CustomPainter {
  final double animationValue;
  
  WovenStructurePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width * 0.7; // Position towards right
    final centerY = size.height * 0.5;
    final baseRadius = math.min(size.width, size.height) * 0.4;
    
    // Create multiple layers of woven curves for 3D depth
    _drawWovenLayer(canvas, centerX, centerY, baseRadius * 1.2, 0, 8);
    _drawWovenLayer(canvas, centerX, centerY, baseRadius, 0.15, 12);
    _drawWovenLayer(canvas, centerX, centerY, baseRadius * 0.8, 0.3, 16);
    _drawWovenLayer(canvas, centerX, centerY, baseRadius * 0.6, 0.45, 20);
  }

  void _drawWovenLayer(Canvas canvas, double cx, double cy, double radius,
      double depthOffset, int strands) {
    final rotation = animationValue * 2 * math.pi + depthOffset * math.pi;
    
    for (int i = 0; i < strands; i++) {
      final angle = (i / strands) * 2 * math.pi + rotation;
      final perpAngle = angle + math.pi / 2;
      
      // Calculate depth-based opacity (closer = more visible)
      final depth = 0.7 - depthOffset;
      final baseOpacity = 0.015 + (depth * 0.02);
      
      // Vertical flowing strand
      final paint1 = Paint()
        ..color = AppColors.accent.withOpacity(baseOpacity)
        ..strokeWidth = 1.5 - (depthOffset * 0.5)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      
      final path1 = Path();
      final startX1 = cx + math.cos(angle) * radius;
      final startY1 = cy + math.sin(angle) * radius;
      
      path1.moveTo(startX1, startY1);
      
      for (int j = 0; j < 4; j++) {
        final t = j / 4;
        final waveOffset = math.sin(angle * 2 + animationValue * 4 * math.pi) * 20;
        final x = startX1 + math.cos(perpAngle) * (t * radius * 0.8) + waveOffset;
        final y = startY1 + math.sin(perpAngle) * (t * radius * 0.8) + waveOffset;
        path1.lineTo(x, y);
      }
      
      canvas.drawPath(path1, paint1);
      
      // Horizontal weaving strand (perpendicular)
      final paint2 = Paint()
        ..color = AppColors.accentSubtle.withOpacity(baseOpacity * 0.8)
        ..strokeWidth = 1.2 - (depthOffset * 0.4)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      
      final path2 = Path();
      final startX2 = cx + math.cos(angle + math.pi / 4) * radius * 0.9;
      final startY2 = cy + math.sin(angle + math.pi / 4) * radius * 0.9;
      
      path2.moveTo(startX2, startY2);
      
      for (int j = 0; j < 3; j++) {
        final t = j / 3;
        final waveOffset = math.cos(angle * 3 - animationValue * 3 * math.pi) * 15;
        final x = startX2 - math.cos(perpAngle) * (t * radius * 0.6) + waveOffset;
        final y = startY2 - math.sin(perpAngle) * (t * radius * 0.6) + waveOffset;
        path2.lineTo(x, y);
      }
      
      canvas.drawPath(path2, paint2);
      
      // Add subtle glow at intersections
      if (i % 3 == 0) {
        final glowPaint = Paint()
          ..color = AppColors.accentGlow.withOpacity(baseOpacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
        
        canvas.drawCircle(
          Offset(startX1, startY1),
          2 - depthOffset,
          glowPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(WovenStructurePainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}
