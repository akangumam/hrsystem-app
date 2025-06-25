import 'dart:io';
import 'package:flutter/material.dart';
import 'package:face_camera/face_camera.dart';
import 'package:geolocator/geolocator.dart';
import 'selfie_clock_in_preview_screen.dart';

class SelfieClockInScreen extends StatefulWidget {
  const SelfieClockInScreen({Key? key}) : super(key: key);

  @override
  State<SelfieClockInScreen> createState() => _SelfieClockInScreenState();
}

class _SelfieClockInScreenState extends State<SelfieClockInScreen> {
  late FaceCameraController controller;
  double? _latitude;
  double? _longitude;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) async {
        if (image != null && _latitude != null && _longitude != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder:
                  (_) => SelfieClockInPreviewScreen(
                    imagePath: image.path,
                    latitude: _latitude,
                    longitude: _longitude,
                    dateTime: DateTime.now(),
                  ),
            ),
          );
        }
      },
    );
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _latitude = 0.0;
          _longitude = 0.0;
          _loading = false;
        });
        return;
      }
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _latitude = pos.latitude;
        _longitude = pos.longitude;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _latitude = 0.0;
        _longitude = 0.0;
        _loading = false;
      });
    }
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
            child: Icon(Icons.arrow_back, color: Colors.black54, size: 28),
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
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Center(
                  child: SizedBox(
                    width: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: SmartFaceCamera(
                        controller: controller,
                        message: 'Center your face in the square',
                        showControls: true,
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}
