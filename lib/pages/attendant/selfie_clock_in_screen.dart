import 'dart:io';
import 'package:flutter/material.dart';
import 'package:face_camera/face_camera.dart';
import 'selfie_clock_in_preview_screen.dart';

class SelfieClockInScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const SelfieClockInScreen({Key? key}) : super(key: key);

  @override
  State<SelfieClockInScreen> createState() => _SelfieClockInScreenState();
}

class _SelfieClockInScreenState extends State<SelfieClockInScreen> {
  late FaceCameraController controller;

  @override
  void initState() {
    super.initState();
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        if (image != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => SelfieClockInPreviewScreen(imagePath: image.path),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4FA),
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/icons/back.png', width: 32),
          ),
        ),
        title: const Text(
          'Selfie To Clock In',
          style: TextStyle(
            color: Color(0xFF101828),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 340,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: SmartFaceCamera(
                controller: controller,
                message: 'Center your face in the square',
                showControls:
                    true, // hanya tombol capture, tidak ada switch camera
              ),
            ),
          ),
        ),
      ),
    );
  }
}
