import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const CybersecurityPortfolioApp());
}

class CybersecurityPortfolioApp extends StatelessWidget {
  const CybersecurityPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muluken Assefa - Cybersecurity Portfolio',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB), // Modern blue
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  bool _isMenuOpen = false;

  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
    setState(() {
      _selectedIndex = index;
      _isMenuOpen = false; // Close menu after selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: _sectionKeys[0], child: const HomeScreen()),
                Container(key: _sectionKeys[1], child: const AboutScreen()),
                Container(key: _sectionKeys[2], child: const SkillsScreen()),
                Container(key: _sectionKeys[3], child: const ProjectsScreen()),
                Container(key: _sectionKeys[4], child: const ExperienceScreen()),
                Container(key: _sectionKeys[5], child: const ContactScreen()),
              ],
            ),
          ),
          // Fixed navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 15 : 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.security,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'MA',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2563EB),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: _isMenuOpen
                            ? const LinearGradient(
                                colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                              )
                            : null,
                        color: _isMenuOpen ? null : const Color(0xFF2563EB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return RotationTransition(
                              turns: animation,
                              child: child,
                            );
                          },
                          child: Icon(
                            _isMenuOpen ? Icons.close_rounded : Icons.menu_rounded,
                            key: ValueKey(_isMenuOpen),
                            color: _isMenuOpen ? Colors.white : const Color(0xFF2563EB),
                            size: 28,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isMenuOpen
                      ? Column(
                          children: [
                            const SizedBox(height: 20),
                            _buildMobileMenuItem('Home', Icons.home_rounded, 0),
                            _buildMobileMenuItem('About', Icons.person_rounded, 1),
                            _buildMobileMenuItem('Skills', Icons.star_rounded, 2),
                            _buildMobileMenuItem('Projects', Icons.work_rounded, 3),
                            _buildMobileMenuItem('Experience', Icons.timeline_rounded, 4),
                            _buildMobileMenuItem('Contact', Icons.contact_mail_rounded, 5),
                            const SizedBox(height: 10),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: const Icon(
                        Icons.security,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Muluken Assefa',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildNavItem('Home', 0),
                    _buildNavItem('About', 1),
                    _buildNavItem('Skills', 2),
                    _buildNavItem('Projects', 3),
                    _buildNavItem('Experience', 4),
                    _buildNavItem('Contact', 5),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildMobileMenuItem(String title, IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 200 + (index * 50)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: () => _scrollToSection(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                  )
                : null,
            color: isSelected ? null : Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.2)
                      : const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xFF2563EB),
                  size: 20,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
              const Spacer(),
              if (isSelected)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    final isSelected = _selectedIndex == index;
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 15),
      child: TextButton(
        onPressed: () => _scrollToSection(index),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          backgroundColor: isSelected
              ? const Color(0xFF2563EB).withOpacity(0.1)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 12 : 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? const Color(0xFF2563EB) : Colors.black87,
          ),
        ),
      ),
    );
  }
}
