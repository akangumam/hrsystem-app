import 'package:flutter/material.dart';
import 'pages/onboarding/presentation/splash_screen.dart';
import 'pages/onboarding/presentation/onboarding_screen.dart';
import 'pages/sign_in/sign_in_screen.dart';
import 'pages/main_screen.dart';
import 'pages/attendant/attendant_clock_in_screen.dart'; // <-- Tambahkan ini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          '/', // Ganti ke '/attendant-clock-in' jika mau langsung tes screen ini
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/main': (context) => const MainScreen(),
        '/attendant-clock-in':
            (context) =>
                const AttendantClockInScreen(), // <-- Tambahkan route ini
      },
    );
  }
}
