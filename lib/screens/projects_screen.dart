import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

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
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            'Projects',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Real-world security projects and achievements',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 20,
              color: AppColors.textSecondary,
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
                null,
              ),
              _buildProjectCard(
                'Smart Exam Preparation App',
                'Developed secure mobile application for ministry exam preparation, that students can get soft copy text and reference books, organized past exams with AI explanation, parents can see their childrens progress, teacher and the admin can watch the analyses of their students progress.',
                [],
                Icons.school_rounded,
                isMobile,
                'https://smart-exam-app9.web.app',
              ),
           _buildProjectCard(
  'Expense Manager Application',
  'Secure Expense Manager mobile application that digitizes personal financial tracking, enabling users to log income and expenses, categorize transactions, and analyze spending behavior through dynamic dashboards. Implemented user authentication, input validation, and secure cloud storage to ensure data integrity, privacy.',
  [],
  Icons.account_balance_wallet_rounded,
  isMobile,
  'https://muluken-expense-manager.web.app/',
),
               _buildProjectCard(
  'Dormitory Attendance Marker',
  'Replaced the manual paper-based attendance system with a mobile app that allows students to mark attendance anywhere within the university campus. Attendance is location-verified to ensure authenticity, each student is registered uniquely, and all data is securely backed up.',
  [],
  Icons.check_circle_rounded,
  isMobile,
  'https://dormitory-attendance-app.web.app/',
),

              _buildProjectCard(
                'Tour Guide Website',
                'Developed secure tourism website with protected user data, secure file storing and good centered information distribution.',
                [],
                Icons.travel_explore_rounded,
                isMobile,
                'https://wondersofgamo1.gt.tc/',
              ),
             
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> tech,
      IconData icon, bool isMobile, String? projectUrl) {
    return Container(
      width: isMobile ? double.infinity : 350,
      height: isMobile ? 280 : 320,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.accent.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentGlow.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 12 : 15),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  border: Border.all(
                    color: AppColors.accent.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.accent, size: isMobile ? 25 : 30),
              ),
              if (projectUrl != null)
                IconButton(
                  icon: const Icon(Icons.open_in_new_rounded),
                  color: AppColors.accent,
                  tooltip: 'View Project',
                  onPressed: () => _launchURL(projectUrl),
                ),
            ],
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.6,
                color: AppColors.textSecondary,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          if (projectUrl != null)
            ElevatedButton.icon(
              onPressed: () => _launchURL(projectUrl),
              icon: const Icon(Icons.launch, size: 16),
              label: Text(
                'View Live',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.background,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
