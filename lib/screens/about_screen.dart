import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../widgets/woven_background.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 50 : 100,
      ),
      color: AppColors.background,
      child: isMobile
          ? Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1a1a1a), Color(0xFF2d2d2d)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1a1a1a).withOpacity(0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/TEZAR.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.person, size: 100, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _buildContent(isMobile),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.cardBg,
                      border: Border.all(
                        color: AppColors.accent.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentGlow.withOpacity(0.05),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/TEZAR.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.person, size: 150, color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildContent(isMobile)),
              ],
            ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: isMobile ? 5 : 10),
        Text(
          'Full-Stack Developer, Cybersecurity & IT Specialist',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 16 : 24,
            fontWeight: FontWeight.w500,
            color: AppColors.accent,
          ),
        ),
        SizedBox(height: isMobile ? 15 : 30),
        Text(
          'Hi, I am Muluken Assefa, an Information Technology Specialist and software developer since 2022 at Arbaminch University. In 2025, I completed an intensive internship at INSA (Information Network Security Agency) where I discovered a critical vulnerability with CVSS score of 9.6 and conducted penetration testing on multiple enterprise systems.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 20),
        Text(
          'I bridge the gap between security and development, building robust applications while maintaining a security-first mindset. My development expertise spans mobile and web applications using Flutter for cross-platform mobile development and React for dynamic web interfaces, with backend systems powered by Node.js, Firebase, and Supabase for rapid deployment, real-time data synchronization, and scalable infrastructure. I work with diverse database technologies, including PostgreSQL, MongoDB, and SQL Server, and leverage Firebase to build scalable and reliable applications.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 20),
        Text(
          'My technical toolkit includes Java and C# for enterprise application development and Python for scripting, and backend development. I combine secure coding practices with modern development frameworks to create applications that are not only functional and scalable but also reliable and resilient against security threats.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 40),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStat('9.6', 'CVSS Critical Finding'),
                  const SizedBox(height: 20),
                  _buildStat('3', 'Companies Tested'),
                  const SizedBox(height: 20),
                  _buildStat('2', 'Years Experience'),
                ],
              )
            : Row(
                children: [
                  _buildStat('9.6', 'CVSS Critical Finding'),
                  const SizedBox(width: 60),
                  _buildStat('3', 'Companies Tested'),
                  const SizedBox(width: 60),
                  _buildStat('2', 'Years Experience'),
                ],
              ),
      ],
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}


// Subtle flowing background painter
class _AboutBgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accent.withOpacity(0.015)
      ..style = PaintingStyle.fill;
    
    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.3, size.height * 0.35,
      size.width * 0.6, size.height * 0.45,
    );
    path.quadraticBezierTo(
      size.width * 0.85, size.height * 0.52,
      size.width, size.height * 0.48,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
