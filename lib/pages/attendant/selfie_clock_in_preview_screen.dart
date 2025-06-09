import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'selfie_clock_in_screen.dart';

class SelfieClockInPreviewScreen extends StatefulWidget {
  final String imagePath;
  const SelfieClockInPreviewScreen({Key? key, required this.imagePath})
    : super(key: key);

  @override
  State<SelfieClockInPreviewScreen> createState() =>
      _SelfieClockInPreviewScreenState();
}

class _SelfieClockInPreviewScreenState
    extends State<SelfieClockInPreviewScreen> {
  final TextEditingController _notesController = TextEditingController();

  void _showSuccessPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.3),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            // Efek blur pada background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            // Konten modal
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 36,
                  left: 18,
                  right: 18,
                  bottom: 36,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A5AF8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7A5AF8).withOpacity(0.24),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 56,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      "Clock-In Successful!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1B1F),
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "You’re all set! Your clock-in was successful. Head over to your dashboard to see your assigned tasks.",
                      style: TextStyle(
                        color: Color(0xFF636A8F),
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF8861F2),
                                Color(0xFF7544FB),
                                Color(0xFF5A2ED4),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Go To Clock In Page",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = File(widget.imagePath);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FA),
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
        child: Stack(
          children: [
            // Konten Scroll
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(3.1415926535),
                            child: Image.file(
                              imageFile,
                              width: double.infinity,
                              height: 380,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child:
                              ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                label: const Text(
                                  "Retake Photo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder:
                                          (_) => const SelfieClockInScreen(),
                                    ),
                                  );
                                },
                              ).applyGradient(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Clock In Notes (Optional)",
                    style: TextStyle(
                      color: Color(0xFF475467),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Clock-in Notes",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color(0xFFEAECF0),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color(0xFFEAECF0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            // Tombol Clock In fixed di bawah
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child:
                      ElevatedButton(
                        child: const Text(
                          "Clock In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _showSuccessPopup,
                      ).applyGradient(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Extension untuk Gradient Button
extension GradientButton on ElevatedButton {
  Widget applyGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8861F2), Color(0xFF7544FB), Color(0xFF5A2ED4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: this,
    );
  }
}
