import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';

class CertificationsScreen extends StatelessWidget {
  const CertificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            GlassContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '> gpg --list-keys',
                    style: TextStyle(color: Color(0xFF00FF41), fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SECURITY CLEARANCES',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FF41),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCertification('CEH', 'Certified Ethical Hacker', 'EC-Council', '2023'),
                  _buildCertification('OSCP', 'Offensive Security Certified Professional', 'Offensive Security', '2023'),
                  _buildCertification('CISSP', 'Certified Information Systems Security Professional', 'ISC²', '2022'),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildCertification(String code, String name, String org, String year) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF41).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF00FF41).withOpacity(0.3)),
            ),
            child: Text(
              code,
              style: const TextStyle(
                color: Color(0xFF00FF41),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '$org • $year',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
