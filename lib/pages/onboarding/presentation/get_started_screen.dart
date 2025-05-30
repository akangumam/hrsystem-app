import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../sign_in/sign_in_screen.dart';

/// GetStartedScreen: layar yang muncul setelah onboarding selesai,
/// dengan background image dan tombol Get Started yang melanjutkan ke SignInScreen.
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/getstartedbg.png',
              fit: BoxFit.cover,
            ),
          ),

          // Get Started button
          Positioned(
            left: 24,
            right: 24,
            bottom: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 600),
                    child: const SignInScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.50, -0.00),
                    end: Alignment(0.50, 1.00),
                    colors: [
                      Color(0xFF8861F2),
                      Color(0xFF7544FB),
                      Color(0xFF5A2ED4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFA686FF)),
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
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.10,
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
          ),
        ],
      ),
    );
  }
}
