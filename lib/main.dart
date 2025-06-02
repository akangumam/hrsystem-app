import 'package:flutter/material.dart';
import 'pages/onboarding/presentation/splash_screen.dart';
import 'pages/onboarding/presentation/onboarding_screen.dart';
import 'pages/sign_in/sign_in_screen.dart';
import 'pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
