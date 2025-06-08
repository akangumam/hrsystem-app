import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelfieClockInPreviewScreen extends StatefulWidget {
  final File imageFile;
  final double latitude;
  final double longitude;

  const SelfieClockInPreviewScreen({
    Key? key,
    required this.imageFile,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<SelfieClockInPreviewScreen> createState() =>
      _SelfieClockInPreviewScreenState();
}

class _SelfieClockInPreviewScreenState
    extends State<SelfieClockInPreviewScreen> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateStr = DateFormat('dd/MM/yy HH:mm a').format(now);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png", width: 24, height: 24),
          onPressed: () => Navigator.of(context).pop(),
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
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // FOTO + OVERLAY
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: Image.file(
                              widget.imageFile,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width * 0.8,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 18,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.22),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lat : ${widget.latitude.toStringAsFixed(5)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "Long : ${widget.longitude.toStringAsFixed(5)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    dateStr + " GMT +07:00",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // RETAKE BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: Material(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () => Navigator.of(context).pop(),
                            child: Ink(
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.5, -0.0),
                                  end: Alignment(0.5, 1.0),
                                  colors: [
                                    Color(0xFF8861F2),
                                    Color(0xFF7544FB),
                                    Color(0xFF5A2ED4),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFA686FF),
                                  ),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0xFF6938EF),
                                    blurRadius: 0,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Retake Photo',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        height: 1.43,
                                        letterSpacing: 0.10,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 16,
                                            color: Color(0xFF2D1A62),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // CATATAN
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Clock In Notes (Optional)",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE0E5ED)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        child: TextField(
                          controller: _notesController,
                          minLines: 3,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Clock-in Notes",
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFFB6B6C0),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
            // CLOCK IN BUTTON (STICKY)
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        // Kirim _notesController.text dan file/image ke proses berikutnya
                        Navigator.of(context).pop(true);
                      },
                      child: Ink(
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.5, -0.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color(0xFF8861F2),
                              Color(0xFF7544FB),
                              Color(0xFF5A2ED4),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFA686FF),
                            ),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0xFF6938EF),
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Clock In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              height: 1.43,
                              letterSpacing: 0.10,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 16,
                                  color: Color(0xFF2D1A62),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
