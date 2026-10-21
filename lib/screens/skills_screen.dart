import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

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
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            'Skills & Expertise',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Bridging security and development with modern technologies',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 20,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          
          // All skills without section titles
          Wrap(
            spacing: isMobile ? 15 : 30,
            runSpacing: isMobile ? 15 : 30,
            alignment: WrapAlignment.center,
            children: [
              // 1. Penetration Testing (includes vuln assessment & network security)
              _buildSkillCard(
                'Penetration Testing', 
                '• Burp Suite, Metasploit, Nmap\n• Nikto, Hydra\n• Vulnerability Assessment\n• CVSS Scoring, OWASP Top 10\n• Network Security\n• Reconnaissance & Enumeration', 
                Icons.security_rounded, 
                isMobile
              ),
              // 2. Flutter & Mobile Development (combined)
              _buildSkillCard(
                'Flutter & Mobile Development', 
                '• Cross-platform Mobile Apps\n• Dart Programming\n• State Management\n• Secure Authentication\n• Real-time Synchronization', 
                Icons.phone_android_rounded, 
                isMobile
              ),
              // 3. Backend & Databases (combined)
              _buildSkillCard(
                'Backend & Databases', 
                '• React, Node.js\n• Firebase, Supabase\n• PostgreSQL, MongoDB\n• SQL Server\n• RESTful APIs\n• Real-time Data', 
                Icons.storage_rounded, 
                isMobile
              ),
              // 4. System Administration
              _buildSkillCard(
                'System Administration',
                '• Odoo ERP Administration\n• Server Management\n• Network Configuration\n• Technical Support\n• System Troubleshooting\n• IT Infrastructure',
                Icons.computer_rounded, 
                isMobile
              ),
              // 5. Python (unchanged)
              _buildSkillCard(
                'Python', 
                '• Scripting & Automation\n• Backend Development\n• Data Processing\n• API Development', 
                Icons.code_rounded, 
                isMobile
              ),
              // 6. Java & C# (unchanged)
              _buildSkillCard(
                'Java & C#', 
                '• Enterprise Applications\n• Object-Oriented Programming\n• Desktop Development\n• Business Logic Implementation', 
                Icons.business_rounded, 
                isMobile
              ),
            ],
          ),
          SizedBox(height: isMobile ? 40 : 60),
          
          // Core Competencies (keeping this section title)
          _buildSectionTitle('Core Competencies', isMobile),
          SizedBox(height: isMobile ? 20 : 30),
          Wrap(
            spacing: isMobile ? 15 : 30,
            runSpacing: isMobile ? 15 : 30,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard(
                'Secure Coding', 
                '• Security-first Development\n• Threat Mitigation\n• Code Review\n• Vulnerability Prevention', 
                Icons.shield_rounded, 
                isMobile
              ),
              _buildSkillCard(
                'Full-Stack Development', 
                '• End-to-end Application Building\n• Frontend & Backend Integration\n• Database Design\n• API Development', 
                Icons.layers_rounded, 
                isMobile
              ),
              _buildSkillCard(
                'Problem Solving', 
                '• Critical Thinking\n• System Design\n• Debugging & Troubleshooting\n• Performance Optimization', 
                Icons.psychology_rounded, 
                isMobile
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 30,
        vertical: isMobile ? 10 : 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColors.accent,
            width: 3,
          ),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 20 : 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSkillCard(String skill, String description, IconData icon, bool isMobile) {
    return HoverBuilder(
      builder: (isHovered) {
        return Container(
          width: isMobile ? double.infinity : 350,
          height: isMobile ? null : 280, // Fixed height for uniform cards
          padding: EdgeInsets.all(isMobile ? 20 : 25),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isHovered 
                  ? AppColors.accent.withOpacity(0.6)
                  : AppColors.accent.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? AppColors.accentGlow.withOpacity(0.2)
                    : AppColors.accentGlow.withOpacity(0.05),
                blurRadius: isHovered ? 30 : 20,
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isHovered 
                          ? AppColors.accent.withOpacity(0.15)
                          : AppColors.accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.accent,
                      size: isMobile ? 22 : 26,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      skill,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 17 : 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 13 : 14,
                      height: 1.8,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Hover builder widget
class HoverBuilder extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const HoverBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.builder(_isHovered),
    );
  }
}
