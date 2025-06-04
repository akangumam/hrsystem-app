import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AttendantClockInScreen extends StatelessWidget {
  const AttendantClockInScreen({Key? key}) : super(key: key);

  static final LatLng userLatLng = LatLng(
    -6.175392,
    106.827153,
  ); // Contoh: Monas

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text(
          "Clock In Area",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // MAP SECTION
          SizedBox(
            width: double.infinity,
            height: size.height * 0.37,
            child: FlutterMap(
              options: MapOptions(
                center: userLatLng,
                zoom: 18,
                interactiveFlags:
                    InteractiveFlag.pinchZoom | InteractiveFlag.drag,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.app',
                ),
                // Circle Area (Clock In Radius)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: userLatLng,
                      color: Colors.purple.withOpacity(0.16),
                      borderColor: Colors.purple,
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: 100,
                    ),
                  ],
                ),
                // User Marker
                MarkerLayer(
                  markers: [
                    Marker(
                      point: userLatLng,
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.purple.shade200,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.18),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/user.png', // Pastikan asset ada
                            width: 60,
                            height: 60,
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
          // CONTENT BELOW MAP
          Positioned(
            top: size.height * 0.33 - 16,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  // Bagian scrollable (card, profile, dsb)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                        child: Column(
                          children: [
                            // Card: You are in the clock-in area!
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B6CF3),
                                  borderRadius: BorderRadius.circular(16),
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
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "Now you can press clock in in this area",
                                            style: TextStyle(
                                              color: Color(0xFFEDE9FF),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto',
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
                            ),
                            const SizedBox(height: 18),

                            // Profile section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "MY PROFILE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEFEFE),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Color(0xFFD0D5DD),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.asset(
                                            'assets/icons/user.png',
                                            width: 60,
                                            height: 60,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Color(0xFF7A5AF8),
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Text(
                                                    "Lat ${userLatLng.latitude.toStringAsFixed(5)}, Long ${userLatLng.longitude.toStringAsFixed(3)}",
                                                    style: const TextStyle(
                                                      color: Color(0xFF475467),
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                  const Text(
                                    "SCHEDULE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFE3E4EB),
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "CLOCK IN",
                                                style: TextStyle(
                                                  color: Color(0xFF475467),
                                                  fontSize: 11,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "09:00",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFE3E4EB),
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "CLOCK OUT",
                                                style: TextStyle(
                                                  color: Color(0xFF475467),
                                                  fontSize: 11,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "05:00",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Tombol Selfie to Clock In (selalu sticky di bawah)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
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
                            // TODO: Aksi selfie di sini
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
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
