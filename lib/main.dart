import 'package:flutter/material.dart';
import 'package:face_camera/face_camera.dart';
import 'pages/onboarding/presentation/splash_screen.dart';
import 'pages/onboarding/presentation/onboarding_screen.dart';
import 'pages/sign_in/sign_in_screen.dart';
import 'pages/main_screen.dart';
import 'pages/attendant/attendant_clock_in_screen.dart';
import 'pages/attendant/selfie_clock_in_screen.dart'; // <-- Tambahkan

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FaceCamera.initialize();
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
        '/attendant-clock-in': (context) => const AttendantClockInScreen(),
        '/selfie-clock-in':
            (context) => const SelfieClockInScreen(), // Tambah route ini
      },
    );
  }
}
