import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 50 : 100,
      ),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Skills',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Mastering tools and techniques for cybersecurity excellence',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 20,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 60),
          Wrap(
            spacing: isMobile ? 20 : 40,
            runSpacing: isMobile ? 20 : 40,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard('Flutter Development', 'Medium - Dart', isMobile),
              _buildSkillCard('Penetration Testing', 'Burp Suite, Metasploit, Nmap', isMobile),
              _buildSkillCard('Data Analysis', 'Beginner - Python', isMobile),
              _buildSkillCard('Vulnerability Assessment', 'Security Auditing & Testing', isMobile),
              _buildSkillCard('Web Development', 'Frontend & Backend', isMobile),
              _buildSkillCard('Network Security', 'Security Protocols & Analysis', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String skill, String description, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getSkillIcon(skill),
                  color: Colors.white,
                  size: isMobile ? 20 : 24,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  skill,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 13 : 14,
              height: 1.5,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getSkillIcon(String skill) {
    if (skill.contains('Flutter')) return Icons.phone_android_rounded;
    if (skill.contains('Penetration')) return Icons.security_rounded;
    if (skill.contains('Data')) return Icons.analytics_rounded;
    if (skill.contains('Vulnerability')) return Icons.bug_report_rounded;
    if (skill.contains('Web')) return Icons.web_rounded;
    if (skill.contains('Network')) return Icons.wifi_rounded;
    return Icons.code_rounded;
  }
}
