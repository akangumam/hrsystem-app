import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'get_started_screen.dart';

/// OnboardingScreen: page view dengan tiga konten onboarding + halaman final,
/// dilengkapi tombol Next/Skip dan indikator.
class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  // ignore: use_super_parameters
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/onboard1.png',
      'title': 'Welcome to Workmate!',
      'subtitle':
          'Make Smart Decisions! Set clear timelines and celebrate achievements.',
    },
    {
      'image': 'assets/images/onboard2.png',
      'title': 'Manage Stress Effectively',
      'subtitle':
          'Stay Balanced! Track your workload and maintain a healthy stress level with ease.',
    },
    {
      'image': 'assets/images/onboard3.png',
      'title': 'Plan for Success',
      'subtitle':
          'Your Journey Starts Here! Earn achievement badges as you conquer your tasks. Let’s get started!',
    },
    {
      'image': 'assets/images/onboardFinal.png',
      'title': 'Navigate Your Work Journey Efficient & Easy',
      'subtitle':
          'Increase your work management & career development radically.',
    },
  ];

  void _nextOrStart() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const GetStartedScreen(),
          duration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const GetStartedScreen(),
        duration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7A5AF8), Colors.white],
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (_, idx) {
                final p = pages[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 80,
                  ),
                  child: Column(
                    children: [
                      Image.asset(p['image']!, width: 300, height: 300),
                      const SizedBox(height: 40),
                      Text(
                        p['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        p['subtitle']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 80,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == i ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              _currentIndex == i
                                  ? Colors.white
                                  : Colors.white38,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: _nextOrStart,
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF8862F2),
                            Color(0xFF7544FC),
                            Color(0xFF5B2ED4),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFA686FF),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0xFF6938EF),
                            blurRadius: 0,
                            offset: Offset(0, 0),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 16,
                                color: Color(0xFF2D1A62),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _skip,
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF8862F2),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF8862F2),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
