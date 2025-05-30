import 'package:flutter/material.dart';

/// Halaman Home sederhana dengan header custom
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F8),
      body: Column(
        children: [
          // ===== HEADER =====
          Container(
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar + info
                  Row(
                    children: [
                      // Avatar asset
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/photo_profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Nama + badge + jabatan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                'Khaerul Umam',
                                style: TextStyle(
                                  color: Color(0xFF2D2D2D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  height: 1.50,
                                  letterSpacing: 0.15,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.check_circle,
                                color: Color(0xFF6E61FF),
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'UI/UX Designer',
                            style: TextStyle(
                              color: Color(0xFF6E61FF),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.33,
                              letterSpacing: -0.50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Icon chat & notif
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFF4F5FF),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(Icons.chat, color: Color(0xFF7A5AF8)),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFF4F5FF),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Color(0xFF7A5AF8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ===== BODY CONTENT =====
          const Expanded(
            child: Center(
              child: Text(
                'Demo Home Page',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
