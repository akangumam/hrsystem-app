import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

import 'selfie_clock_in_preview_screen.dart'; // Pastikan file preview sudah ada

class SelfieClockInScreen extends StatefulWidget {
  const SelfieClockInScreen({Key? key}) : super(key: key);

  @override
  State<SelfieClockInScreen> createState() => _SelfieClockInScreenState();
}

class _SelfieClockInScreenState extends State<SelfieClockInScreen> {
  bool _loading = false;

  // Open camera depan & simpan lokasi saat ini
  Future<void> _openCamera() async {
    setState(() => _loading = true);
    try {
      // Request location permission & get current position
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Izin lokasi diperlukan!')),
        );
        return;
      }
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 90,
        maxWidth: 1200,
      );
      setState(() => _loading = false);

      if (pickedFile != null) {
        // **Langsung push ke preview screen, tanpa konfirmasi**
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:
                (_) => SelfieClockInPreviewScreen(
                  imageFile: File(pickedFile.path),
                  latitude: pos.latitude,
                  longitude: pos.longitude,
                ),
          ),
        );
      } else {
        Navigator.of(context).pop(); // jika batal, balik ke halaman sebelumnya
      }
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal mengambil gambar: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    // Kamera langsung terbuka saat masuk halaman
    WidgetsBinding.instance.addPostFrameCallback((_) => _openCamera());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (_loading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF7A5AF8)),
            ),
        ],
      ),
    );
  }
}
