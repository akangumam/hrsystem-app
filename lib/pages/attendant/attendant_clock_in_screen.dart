import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'selfie_clock_in_screen.dart';

class AttendantClockInScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const AttendantClockInScreen({Key? key}) : super(key: key);

  @override
  State<AttendantClockInScreen> createState() => _AttendantClockInScreenState();
}

class _AttendantClockInScreenState extends State<AttendantClockInScreen> {
  final MapController _mapController = MapController();
  LatLng? _userLatLng;

  // Office Location (fix, sesuai request)
  static final LatLng officeLatLng = LatLng(
    -6.379878162378265,
    106.69992409311826,
  );

  bool _isGettingLocation = false;

  @override
  void initState() {
    super.initState();
    _getAndListenUserLocation();
  }

  // Get user location once and listen to changes
  void _getAndListenUserLocation() async {
    setState(() => _isGettingLocation = true);

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Bisa tampilkan alert di sini
      setState(() => _isGettingLocation = false);
      return;
    }

    // Ambil posisi awal
    Position pos = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _userLatLng = LatLng(pos.latitude, pos.longitude);
      _isGettingLocation = false;
    });

    // Listen perubahan lokasi
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 5,
      ),
    ).listen((pos) {
      setState(() {
        _userLatLng = LatLng(pos.latitude, pos.longitude);
      });
    });
  }

  // Button to recenter to user location
  void _centerToUser() {
    if (_userLatLng != null) {
      _mapController.move(_userLatLng!, 18);
    }
  }

  // Cek apakah user dalam radius office
  bool _isInOfficeArea() {
    if (_userLatLng == null) return false;
    final Distance distance = Distance();
    double meter = distance.as(LengthUnit.Meter, _userLatLng!, officeLatLng);
    return meter <= 10000; // 10000 meter
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // MAP
          SizedBox(
            width: double.infinity,
            height: size.height * 0.4,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                // ignore: deprecated_member_use
                center: officeLatLng,
                // ignore: deprecated_member_use
                zoom: 17.5,
                minZoom: 5,
                maxZoom: 19,
                // onPositionChanged untuk non-auto-follow
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.app',
                ),
                // Area Absensi (100 meter)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: officeLatLng,
                      color: const Color(0x196938EF), // #6938EF 10%
                      borderColor: const Color(0xFF7A5AF8), // #7A5AF8
                      borderStrokeWidth: 1,
                      useRadiusInMeter: true,
                      radius: 50,
                    ),
                  ],
                ),
                // Marker Office & User
                MarkerLayer(
                  markers: [
                    // Office Marker
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
                    // User Marker (if available)
                    if (_userLatLng != null)
                      Marker(
                        point: _userLatLng!,
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

          // Tombol recenter user
          Positioned(
            top: size.height * 0.30,
            right: 20,
            child: Material(
              color: const Color.fromARGB(255, 255, 255, 255),
              shape: const CircleBorder(),
              elevation: 3,
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/my_location.png",
                  width: 24,
                  height: 24,
                ),
                onPressed: _centerToUser,
              ),
            ),
          ),

          // APPBAR TRANSPARAN + BACK + TITLE
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            right: 0,
            child: Row(
              children: [
                Material(
                  // ignore: deprecated_member_use
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
                SizedBox(width: 56), // Placeholder biar center
              ],
            ),
          ),

          // CONTENT + STICKY BUTTON
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Container(
                constraints: BoxConstraints(
                  // Ubah sedikit biar sticky button ga overflow di hp kecil
                  maxHeight: size.height * 0.55,
                  minHeight: 240,
                ),
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
                    // Scrollable Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Info Clock-in Area
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
                                      children: [
                                        Text(
                                          _isInOfficeArea()
                                              ? "You are in the clock-in area!"
                                              : "You are OUTSIDE the clock-in area!",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _isInOfficeArea()
                                              ? "Now you can press clock in in this area"
                                              : "Go to office area to clock in.",
                                          style: const TextStyle(
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

                            // My Profile
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
                                            Text(
                                              _userLatLng != null
                                                  ? "Lat ${_userLatLng!.latitude.toStringAsFixed(5)}, Long ${_userLatLng!.longitude.toStringAsFixed(5)}"
                                                  : "Lokasi tidak diketahui",
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
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                                          "08:00",
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
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                      child: SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: Material(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap:
                                _isInOfficeArea()
                                    ? () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  const SelfieClockInScreen(),
                                        ),
                                      );
                                    }
                                    : null, // Disable button jika di luar area
                            child: Ink(
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
                              child: Center(
                                child: Text(
                                  'Selfie To Clock In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(
                                      _isInOfficeArea() ? 1 : 0.4,
                                    ),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 1.43,
                                    letterSpacing: 0.10,
                                    shadows: const [
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
              ),
            ),
          ),
          // Jika sedang ambil lokasi
          if (_isGettingLocation)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
