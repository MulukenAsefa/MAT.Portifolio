import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: isMobile
          ? Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2563EB).withOpacity(0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.person, size: 100, color: Colors.white),
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
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.person, size: 150, color: Colors.white),
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
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: isMobile ? 5 : 10),
        Text(
          'Passionate about securing the digital world',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 16 : 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2563EB),
          ),
        ),
        SizedBox(height: isMobile ? 15 : 30),
        Text(
          'Hi, I am Muluken Assefa, an Information Technology student specializing in Cybersecurity since 2022. In 2025, I completed an internship at INSA (Information Network Security Agency) where I discovered a critical vulnerability with CVSS score of 9.6 and conducted penetration testing on multiple enterprise systems.',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 20),
        Text(
          'I specialize in offensive security operations, secure application development, and data analytics. My portfolio includes mobile apps (Exam Preparation, Expense Manager), web development (Tour Guide Website), and extensive penetration testing experience. Currently pursuing advanced security research in 2026.',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.black87,
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
                  _buildStat('4', 'Years Experience'),
                ],
              )
            : Row(
                children: [
                  _buildStat('9.6', 'CVSS Critical Finding'),
                  const SizedBox(width: 60),
                  _buildStat('3', 'Companies Tested'),
                  const SizedBox(width: 60),
                  _buildStat('4', 'Years Experience'),
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
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2563EB),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
