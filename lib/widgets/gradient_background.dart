import 'package:flutter/material.dart';
import '../constants/colors.dart';

// Subtle flowing tendril/wave background - minimal, not distracting
class SubtleFlowingBackground extends StatelessWidget {
  final Widget child;
  
  const SubtleFlowingBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Stack(
        children: [
          // Subtle flowing tendrils - very minimal
          Positioned.fill(
            child: CustomPaint(
              painter: TendrilPainter(),
            ),
          ),
          // Content on top
          child,
        ],
      ),
    );
  }
}

class TendrilPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accent.withOpacity(0.02)
      ..style = PaintingStyle.fill;
    
    final path1 = Path();
    path1.moveTo(0, size.height * 0.3);
    path1.quadraticBezierTo(
      size.width * 0.25, size.height * 0.25,
      size.width * 0.5, size.height * 0.35,
    );
    path1.quadraticBezierTo(
      size.width * 0.75, size.height * 0.45,
      size.width, size.height * 0.4,
    );
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    
    canvas.drawPath(path1, paint);
    
    final paint2 = Paint()
      ..color = AppColors.accentSubtle.withOpacity(0.015)
      ..style = PaintingStyle.fill;
    
    final path2 = Path();
    path2.moveTo(0, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width * 0.3, size.height * 0.65,
      size.width * 0.6, size.height * 0.75,
    );
    path2.quadraticBezierTo(
      size.width * 0.8, size.height * 0.82,
      size.width, size.height * 0.75,
    );
    path1.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
