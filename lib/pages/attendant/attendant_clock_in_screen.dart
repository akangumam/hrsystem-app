import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AttendantClockInScreen extends StatelessWidget {
  const AttendantClockInScreen({Key? key}) : super(key: key);

  static final LatLng userLatLng = LatLng(-6.175392, 106.827153); // User
  static final LatLng officeLatLng = LatLng(
    -6.3799080698279305,
    106.69993971908592,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F8),
      extendBody: true,
      // Custom AppBar transparan
      body: Stack(
        children: [
          // MAP
          SizedBox(
            width: double.infinity,
            height: size.height * 0.4,
            child: FlutterMap(
              options: MapOptions(
                center: officeLatLng,
                zoom: 17.5,
                interactiveFlags:
                    InteractiveFlag.pinchZoom | InteractiveFlag.drag,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.app',
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: officeLatLng,
                      color: const Color(0x196938EF),
                      borderColor: const Color(0xFF7A5AF8),
                      borderStrokeWidth: 1,
                      useRadiusInMeter: true,
                      radius: 100,
                    ),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    // Office
                    Marker(
                      point: officeLatLng,
                      width: 36,
                      height: 36,
                      child: Image.asset(
                        "assets/icons/office.png",
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // User
                    Marker(
                      point: userLatLng,
                      width: 56,
                      height: 56,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF7A5AF8),
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/icons/user.png",
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tombol center user
          Positioned(
            top: size.height * 0.4 - 44,
            right: 18,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 3,
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/pin.png",
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  // TODO: implementasi recenter map ke lokasi user
                },
              ),
            ),
          ),

          // CUSTOM APPBAR TRANSPARAN + BACK
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            right: 0,
            child: Row(
              children: [
                // Tombol Back
                Material(
                  color: Colors.white.withOpacity(0.7),
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF101828),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Clock In Area",
                    style: TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 56), // Placeholder agar judul center
              ],
            ),
          ),

          // CONTENT + STICKY BUTTON (pakai bottomNavigationBar biar ga overflow)
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Container(
                // Tinggi card, supaya tidak kelihatan terlalu tinggi di device kecil
                constraints: BoxConstraints(maxHeight: size.height * 0.62),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEFEFE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SCROLLABLE CONTENT
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Info clock-in area
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              margin: const EdgeInsets.only(bottom: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF785FFB),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "You are in the clock-in area!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Now you can press clock in in this area",
                                          style: TextStyle(
                                            color: Color(0xFFEDE9FF),
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/icons/flying_clock.png',
                                    width: 46,
                                    height: 46,
                                  ),
                                ],
                              ),
                            ),

                            // My Profile label
                            const Padding(
                              padding: EdgeInsets.only(left: 2, bottom: 6),
                              child: Text(
                                "MY PROFILE",
                                style: TextStyle(
                                  color: Color(0xFF101828),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.33,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),

                            // Profile card
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEFEFE),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFFD0D5DD),
                                ),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      "assets/icons/user.png",
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Khaerul Umam",
                                              style: TextStyle(
                                                color: Color(0xFF2D2D2D),
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                letterSpacing: 0.15,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Image.asset(
                                              'assets/icons/badge.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        const Text(
                                          "29 September 2024",
                                          style: TextStyle(
                                            color: Color(0xFF7A5AF8),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/pin.png",
                                              width: 14,
                                              height: 14,
                                            ),
                                            const SizedBox(width: 3),
                                            const Text(
                                              "Lat 45.43534 Long 97897.576",
                                              style: TextStyle(
                                                color: Color(0xFF475467),
                                                fontSize: 12,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                height: 1.33,
                                                letterSpacing: -0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),

                            // SCHEDULE label
                            const Padding(
                              padding: EdgeInsets.only(left: 2, bottom: 6),
                              child: Text(
                                "SCHEDULE",
                                style: TextStyle(
                                  color: Color(0xFF101828),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.33,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),

                            // Jadwal clock-in/out
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF9FAFB),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xFFEAECF0),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "CLOCK IN",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF475467),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 1.45,
                                            letterSpacing: -0.15,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "09:00",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF9FAFB),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xFFEAECF0),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "CLOCK OUT",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF475467),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 1.45,
                                            letterSpacing: -0.15,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "05:00",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    // STICKY BUTTON
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                        left: 8,
                        right: 8,
                        top: 4,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 54,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
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
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              // TODO: aksi selfie di sini
                            },
                            child: const Center(
                              child: Text(
                                'Selfie To Clock In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
