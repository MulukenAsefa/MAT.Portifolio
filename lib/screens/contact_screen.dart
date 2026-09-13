import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback: try with platformDefault mode
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      // If all fails, try one more time with platformDefault
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (e) {
        print('Could not launch $url: $e');
      }
    }
  }

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
      child: Column(
        children: [
          Text(
            'Contact',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 5 : 10),
          Text(
            'Let\'s connect and discuss cybersecurity',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 20,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 60),
          isMobile
              ? Column(
                  children: [
                    _buildContactCard(
                      Icons.email,
                      'Email',
                      'mulukenasefateju@gmail.com',
                      isMobile,
                      'mailto:mulukenasefateju@gmail.com',
                    ),
                    const SizedBox(height: 20),
                    _buildContactCard(
                      Icons.code,
                      'GitHub',
                      'MulukenAsefa',
                      isMobile,
                      'https://github.com/MulukenAsefa',
                    ),
                    const SizedBox(height: 20),
                    _buildContactCard(
                      Icons.business,
                      'LinkedIn',
                      'Muluken Assefa',
                      isMobile,
                      'https://www.linkedin.com/in/mulukenassefa',
                    ),
                  ],
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  runSpacing: 20,
                  children: [
                    _buildContactCard(
                      Icons.email,
                      'Email',
                      'mulukenasefateju@gmail.com',
                      isMobile,
                      'mailto:mulukenasefateju@gmail.com',
                    ),
                    _buildContactCard(
                      Icons.code,
                      'GitHub',
                      'MulukenAsefa',
                      isMobile,
                      'https://github.com/MulukenAsefa',
                    ),
                    _buildContactCard(
                      Icons.business,
                      'LinkedIn',
                      'Muluken Assefa',
                      isMobile,
                      'https://www.linkedin.com/in/mulukenassefa',
                    ),
                  ],
                ),
          SizedBox(height: isMobile ? 30 : 60),
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 30),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.accent.withOpacity(0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentGlow.withOpacity(0.2),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Ready to secure your systems?',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 18 : 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isMobile ? 15 : 20),
                ElevatedButton(
                  onPressed: () => _launchURL('https://www.linkedin.com/in/mulukenassefa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.background,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 30 : 40,
                      vertical: isMobile ? 15 : 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Get In Touch',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 20 : 40),
          Text(
            '© 2026 Muluken Assefa. All rights reserved.',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 12 : 14,
              color: AppColors.textSecondary.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String value, bool isMobile, String? url) {
    return MouseRegion(
      cursor: url != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: InkWell(
        onTap: url != null ? () => _launchURL(url) : null,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: isMobile ? double.infinity : 300,
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: url != null 
                  ? AppColors.accent.withOpacity(0.5)
                  : AppColors.accent.withOpacity(0.2),
              width: url != null ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: url != null 
                    ? AppColors.accentGlow.withOpacity(0.15)
                    : Colors.transparent,
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 12 : 15),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  border: Border.all(
                    color: AppColors.accent.withOpacity(0.3),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: isMobile ? 25 : 30,
                  color: AppColors.accent,
                ),
              ),
              SizedBox(height: isMobile ? 15 : 20),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 10),
              Text(
                value,
                style: GoogleFonts.sourceCodePro(
                  fontSize: isMobile ? 12 : 14,
                  color: url != null ? AppColors.accent : AppColors.textSecondary,
                  fontWeight: url != null ? FontWeight.w500 : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              if (url != null) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Click to ${url.startsWith('mailto:') ? 'email' : 'visit'}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppColors.textSecondary.withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.open_in_new,
                      size: 12,
                      color: AppColors.textSecondary.withOpacity(0.7),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
