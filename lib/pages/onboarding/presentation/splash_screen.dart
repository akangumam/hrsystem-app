import 'dart:async';
import 'package:flutter/material.dart';

/// SplashScreen muncul saat aplikasi pertama kali dibuka,
/// dengan background ungu #7A5AF8 dan logo di tengah.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah 3 detik, pindah ke OnboardingScreen via named route
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A5AF8),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 180,
          height: 180,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) {
            return const Icon(Icons.error, size: 48, color: Colors.white);
          },
        ),
      ),
    );
  }
}
