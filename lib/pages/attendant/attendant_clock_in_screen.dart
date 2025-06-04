import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AttendantClockInScreen extends StatelessWidget {
  const AttendantClockInScreen({Key? key}) : super(key: key);

  static final LatLng userLatLng = LatLng(-6.175392, 106.827153);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F8),
      body: Stack(
        children: [
          // Map & Avatar Area
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            height: 330,
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: userLatLng,
                    zoom: 18,
                    interactiveFlags:
                        InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
                // Lingkaran clock-in area
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 222,
                    height: 222,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x196938EE), // #6938EF, opacity 10%
                      border: Border.all(
                        color: const Color(0xFF7A5AF8), // #7A5AF8
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF7A5AF8),
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/user.png',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Header Bar Figma-style (Time + Title)
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Waktu (jam)
                  Text(
                    '8:15',
                    style: const TextStyle(
                      color: Color(0xFF1A1B1D),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  // Icon baterai dsb, di sini dummy
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        size: 16,
                        color: Color(0xFF1A1B1D).withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.battery_full,
                        size: 18,
                        color: Color(0xFF1A1B1D),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Center Title
          Positioned(
            top: 54,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Clock In Area',
                style: const TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ),
          // Card & Konten Bawah
          Positioned(
            left: 0,
            right: 0,
            top: 402,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFEFEFE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Purple Card
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 24, 15, 0),
                    child: Container(
                      width: double.infinity,
                      height: 86,
                      decoration: BoxDecoration(
                        color: const Color(0xFF785FFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 24,
                            child: Text(
                              'You are in the clock-in area!',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 46,
                            child: Text(
                              'Now you can press clock in in this area',
                              style: const TextStyle(
                                color: Color(0xFFEDE9FF),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 16,
                            child: Image.asset(
                              'assets/icons/flying_clock.png',
                              width: 46,
                              height: 46,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // "MY PROFILE"
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'MY PROFILE',
                      style: const TextStyle(
                        color: Color(0xFF101828),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  // Profile Card
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFEAECF0),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/icons/user.png',
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Khaerul Umam',
                                      style: const TextStyle(
                                        color: Color(0xFF2D2D2D),
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        letterSpacing: 0.15,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/icons/badge.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  '29 September 2024',
                                  style: TextStyle(
                                    color: Color(0xFF7A5AF8),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 1.33,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/pin.png',
                                      width: 12,
                                      height: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Lat 45.43534 Long 97897.576',
                                      style: const TextStyle(
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
                  ),
                  // "SCHEDULE"
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 2,
                    ),
                    child: Text(
                      'SCHEDULE',
                      style: const TextStyle(
                        color: Color(0xFF101828),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  // Schedule Cards
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 8,
                      bottom: 24,
                    ),
                    child: Row(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'CLOCK IN',
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
                                  '09:00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'CLOCK OUT',
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
                                  '05:00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
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
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          // Sticky Bottom Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 54,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.5, 0),
                    end: Alignment(0.5, 1),
                    colors: [
                      Color(0xFF8861F2),
                      Color(0xFF7544FB),
                      Color(0xFF5A2ED4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    side: const BorderSide(width: 1, color: Color(0xFFA686FF)),
                  ),
                  shadows: [
                    const BoxShadow(
                      color: Color(0x19AA9FFE),
                      blurRadius: 9,
                      offset: Offset(0, -4),
                    ),
                    const BoxShadow(
                      color: Color(0x16AA9FFE),
                      blurRadius: 17,
                      offset: Offset(0, -17),
                    ),
                    const BoxShadow(
                      color: Color(0x0CAA9FFE),
                      blurRadius: 23,
                      offset: Offset(0, -38),
                    ),
                    const BoxShadow(
                      color: Color(0x02AA9FFE),
                      blurRadius: 27,
                      offset: Offset(0, -67),
                    ),
                    const BoxShadow(
                      color: Color(0x00AA9FFE),
                      blurRadius: 29,
                      offset: Offset(0, -105),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      // TODO: aksi selfie
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
          ),
        ],
      ),
    );
  }
}
