import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelfieClockInScreen extends StatefulWidget {
  const SelfieClockInScreen({Key? key}) : super(key: key);

  @override
  State<SelfieClockInScreen> createState() => _SelfieClockInScreenState();
}

class _SelfieClockInScreenState extends State<SelfieClockInScreen> {
  File? _imageFile;
  bool _loading = false;

  Future<void> _openCamera() async {
    setState(() => _loading = true);
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 90,
        maxWidth: 1200,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
          _loading = false;
        });
      } else {
        setState(() => _loading = false);
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
    _openCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4FA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF101828)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Selfie Clock In',
          style: TextStyle(
            color: Color(0xFF101828),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (_imageFile != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Preview Foto
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 1.05,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A5AF8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Ulangi Foto",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  onPressed: _openCamera,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27AE60),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                  label: const Text(
                    "Gunakan Foto Ini",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  onPressed: () {
                    // lanjut ke proses absen, upload, dll
                    Navigator.of(context).pop(_imageFile);
                  },
                ),
              ],
            ),
          if (_loading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF7A5AF8)),
            ),
          if (!_loading && _imageFile == null)
            const Center(
              child: Text(
                "Tidak ada foto diambil",
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black54),
              ),
            ),
        ],
      ),
    );
  }
}
