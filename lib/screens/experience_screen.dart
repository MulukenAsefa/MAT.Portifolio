import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
            'Experience',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Professional journey and certifications',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 20,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 60),
       
          _buildExperienceItem(
  '2026',
  ' Mobile Application Project',
  'Smart Exam Preparation App',
  'Engineered a full-stack mobile application using Flutter and firebase & supabase  to digitize and optimize exam preparation workflows. Implemented secure authentication, real-time data synchronization, AI API integration for adaptive learning, and performance analytics to enhance user experience, reduce manual overhead, and enable data-driven academic decision-making.',
  true,
  isMobile,
),
          _buildExperienceItem(
            '2025',
            'Cybersecurity career starter',
            'Hack and Fix',
            '"Cybersecurity career starter certification focused on practical ethical hacking, vulnerability discovery, and fixing security issues with hands-on labs and exercises.',
             false,
            isMobile,
          ),
  _buildExperienceItem(
  '2025',
  'INSA Cybersecurity Internship',
  'Cybersecurity Intern on  Penetration Testing',
  'Completed a hands-on cybersecurity internship at the Information Network Security Agency (INSA), performing penetration testing on enterprise systems. Conducted reconnaissance, scanning, enumeration, and exploitation using tools such as Nmap, Nikto, Hydra, Burp Suite, and Metasploit. Identified a critical vulnerability with a CVSS score of 9.6 and applied vulnerability assessment and secure testing methodologies in real-world environments.',
  false,
  isMobile,
),
      _buildExperienceItem(
  '2025',
  ' Artificial Intelligence ',
  'Udacity',
  'Completed an intensive Artificial Intelligence  focusing on search algorithms, probabilistic models, and decision-making systems. Developed intelligent agents using techniques such as A* search, minimax algorithms, and constraint satisfaction. Built real-world AI projects including a Sudoku solver and game-playing agents. ',
  false,
  isMobile,
),
          _buildExperienceItem(
            '2025',
            'Certified ApI penetration Testing.',
            'ApI penetration Testing',
            'Hands-on professional course in API penetration testing covering OWASP API Security Top 10, authentication & authorization attacks, injection attacks, and practical labs using Burp Suite.',
            false,
            isMobile,
          ),
        
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String year, String title, String organization,
      String description, bool isFirst, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 30 : 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: isMobile ? 50 : 60,
                height: isMobile ? 50 : 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                  ),
                ),
                child: Center(
                  child: Text(
                    year,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 10 : 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (!isFirst)
                Container(
                  width: 2,
                  height: isMobile ? 60 : 80,
                  color: Colors.grey[300],
                ),
            ],
          ),
          SizedBox(width: isMobile ? 15 : 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(isMobile ? 20 : 25),
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
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 16 : 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    organization,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2563EB),
                    ),
                  ),
                  SizedBox(height: isMobile ? 10 : 15),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 14,
                      height: 1.6,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
