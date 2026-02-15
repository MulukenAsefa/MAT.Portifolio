import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 50 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Real-world security projects and achievements',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 20,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 60),
          Wrap(
            spacing: isMobile ? 20 : 30,
            runSpacing: isMobile ? 20 : 30,
            alignment: WrapAlignment.center,
            children: [
              _buildProjectCard(
                'Critical Vulnerability Discovery',
                'Discovered critical vulnerability (CVSS 9.6) during penetration testing of enterprise systems. Identified and reported high-severity security flaws.',
                [],
                Icons.bug_report_rounded,
                isMobile,
              ),
              _buildProjectCard(
                ' Exam Preparation App',
                'Developed secure mobile application for exam preparation with encrypted data storage and secure authentication mechanisms.',
                [],
                Icons.school_rounded,
                isMobile,
              ),
              _buildProjectCard(
                'Expense Manager Application',
                'Built expense tracking mobile app with secure data handling, user authentication, and financial data protection.',
                [],
                Icons.account_balance_wallet_rounded,
                isMobile,
              ),
              _buildProjectCard(
                'Tour Guide Website',
                'Developed secure tourism website with protected user data, secure payment integration, and OWASP best practices.',
                [],
                Icons.travel_explore_rounded,
                isMobile,
              ),
              _buildProjectCard(
                'Bank Customer Transaction Analysis',
                'Implemented comprehensive analysis of banking transactions for fraud detection, customer behavior patterns, and financial insights.',
                [],
                Icons.analytics_rounded,
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> tech, IconData icon, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
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
          Container(
            padding: EdgeInsets.all(isMobile ? 12 : 15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: isMobile ? 25 : 30),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 13 : 14,
              height: 1.6,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map((t) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 10 : 12,
                        vertical: isMobile ? 5 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        t,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 11 : 12,
                          color: const Color(0xFF2563EB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
