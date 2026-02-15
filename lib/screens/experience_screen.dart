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
            'Security Research Projects',
            'INSA & Academic Research',
            'Conducting advanced security research on web application vulnerabilities, SQL injection techniques, secure coding practices, and emerging cybersecurity threats.',
            true,
            isMobile,
          ),
          _buildExperienceItem(
            '2025',
            'Cybersecurity Intern',
            'INSA (Information Network Security Agency)',
            'Conducted penetration testing on enterprise systems, discovered critical vulnerability with CVSS score of 9.6. Performed security assessments on three companies, identifying SQL injection, authentication flaws, and access control vulnerabilities.',
            false,
            isMobile,
          ),
          _buildExperienceItem(
            '2025',
            'Certified Ethical Hacker (CEH)',
            'EC-Council',
            'Comprehensive ethical hacking and penetration testing certification covering OWASP Top 10, network security, vulnerability assessment, and offensive security techniques.',
            false,
            isMobile,
          ),
          _buildExperienceItem(
            '2022-Present',
            'Information Technology Student',
            'University - Cybersecurity Specialization',
            'Pursuing Bachelor\'s degree in Information Technology with focus on Cybersecurity, Network Security, and Secure Software Development. Hands-on experience with penetration testing tools and methodologies.',
            false,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String year, String title, String organization, String description, bool isFirst, bool isMobile) {
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
