import 'package:flutter/material.dart';
import 'attendant_clock_in_screen.dart';

class AttendantScreen extends StatelessWidget {
  const AttendantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 233;
    const double cardOffset = -72;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER UNGU
            Container(
              width: double.infinity,
              height: headerHeight,
              decoration: const BoxDecoration(
                color: Color(0xFF785FFB),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Stack(
                children: [
                  // Flying clock (kanan atas)
                  Positioned(
                    right: 20,
                    top: 60,
                    child: Image.asset(
                      'assets/icons/flying_clock.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Judul
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Let's Clock-In!",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Don't miss your clock in schedule",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Color(0xFFD6CDFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, cardOffset),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TotalWorkingHourCard(),
                  ),
                  const SizedBox(height: 16),
                  // Attendant Story Cards, bisa diulang untuk list data attendance
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AttendantStoryCard(
                      date: '27 September 2024',
                      totalHour: '08:00:00',
                      clockIn: '09:00 AM',
                      clockOut: '05:00 PM',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AttendantStoryCard(
                      date: '26 September 2024',
                      totalHour: '08:00:00',
                      clockIn: '09:00 AM',
                      clockOut: '05:00 PM',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AttendantStoryCard(
                      date: '25 September 2024',
                      totalHour: '08:00:00',
                      clockIn: '09:00 AM',
                      clockOut: '05:00 PM',
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TOTAL WORKING HOUR CARD (TETAP)
class TotalWorkingHourCard extends StatelessWidget {
  const TotalWorkingHourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Working Hour',
              style: TextStyle(
                color: Color(0xFF181D2D),
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Paid Period 1 Sept 2024 - 30 Sept 2024',
              style: TextStyle(
                color: Color(0xFF8E95A9),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7FD),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xFFE3E4EB), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            Image.asset(
                              'assets/icons/time_progress.png',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Today',
                              style: TextStyle(
                                color: Color(0xFF8E95A9),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '00:00 Hrs',
                            style: TextStyle(
                              color: Color(0xFF181D2D),
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7FD),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xFFE3E4EB), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            Image.asset(
                              'assets/icons/time_progress.png',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'This Pay Period',
                              style: TextStyle(
                                color: Color(0xFF8E95A9),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '32:00 Hrs',
                            style: TextStyle(
                              color: Color(0xFF181D2D),
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            // Tombol Clock In Now custom gradient
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendantClockInScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
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
                    side: const BorderSide(width: 1, color: Color(0xFFA686FF)),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  shadows: [
                    const BoxShadow(
                      color: Color(0xFF6938EF),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Clock In Now',
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
          ],
        ),
      ),
    );
  }
}

// ATTENDANT STORY CARD, SESUAI FIGMA & SCREENSHOT TERAKHIR
class AttendantStoryCard extends StatelessWidget {
  final String date;
  final String totalHour;
  final String clockIn;
  final String clockOut;

  const AttendantStoryCard({
    Key? key,
    required this.date,
    required this.totalHour,
    required this.clockIn,
    required this.clockOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // responsive, tidak hardcode 366
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris tanggal & ikon kalender
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/calendar.png',
                width: 16,
                height: 16,
                color: const Color(0xFF785FFB),
              ),
              const SizedBox(width: 8),
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Card jam total dan clock in-out
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEAECF0), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Total Hours
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Hours',
                      style: TextStyle(
                        color: Color(0xFF475467),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      '$totalHour hrs',
                      style: const TextStyle(
                        color: Color(0xFF344054),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                // Clock in & Out
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Clock in & Out',
                      style: TextStyle(
                        color: Color(0xFF475467),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      '$clockIn  — $clockOut',
                      style: const TextStyle(
                        color: Color(0xFF344054),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
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
    );
  }
}
