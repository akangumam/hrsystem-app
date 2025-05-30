// lib/main.dart

import 'package:flutter/material.dart';

// Import semua screen via relative path
import 'pages/onboarding/presentation/splash_screen.dart';
import 'pages/onboarding/presentation/onboarding_screen.dart';
import 'pages/onboarding/presentation/get_started_screen.dart';
import 'pages/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR System App',
      debugShowCheckedModeBanner: false,
      // Mulai dari SplashScreen
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/get_started': (_) => const GetStartedScreen(),
        '/home': (_) => const HomeScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Roboto'),
    );
  }
}
