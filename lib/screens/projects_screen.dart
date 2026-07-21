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
                'Developed secure mobile application for ministry exam preparation , that students can get soft copy text and reference books , organized past exams with AI explanation , parents can see their childrens progress , teacher and the admin can watch the analyses of their students progress ',
                [],
                Icons.school_rounded,
                isMobile,
              ),
           _buildProjectCard(
  'Expense Manager Application',
  'Secure Expense Manager mobile application that digitizes personal financial tracking, enabling users to log income and expenses, categorize transactions, and analyze spending behavior through dynamic dashboards. Implemented user authentication, input validation, and secure cloud storage to ensure data integrity, privacy.',
  [],
  Icons.account_balance_wallet_rounded,
  isMobile,
),
               _buildProjectCard(
  'Dormitory Attendance Marker',
  'Replaced the manual paper-based attendance system with a mobile app that allows students to mark attendance anywhere within the university campus. Attendance is location-verified to ensure authenticity, each student is registered uniquely, and all data is securely backed up.',
  [],
  Icons.check_circle_rounded,
  isMobile,
),

              _buildProjectCard(
                'Tour Guide Website',
                'Developed secure tourism website with protected user data, secure file storing and good centered information distribution .',
                [],
                Icons.travel_explore_rounded,
                isMobile,
              ),
             
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> tech,
      IconData icon, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      height: isMobile ? 280 : 320,
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
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.6,
                color: Colors.black54,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map((t) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        t,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
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
