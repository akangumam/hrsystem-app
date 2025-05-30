import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/photo_profile.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                'Khaerul Umam',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.verified,
                                size: 18,
                                color: Color(0xFF785FFB),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'UI/UX Designer',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF785FFB),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Chat Icon
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEF1FF),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/chat.png',
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Notification Icon
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEF1FF),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/notification.png',
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              // Home Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 96,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF785FFB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 28,
                        child: Text(
                          'My Work Summary',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 50,
                        child: Text(
                          'Today task & presence activity',
                          style: TextStyle(
                            color: Color(0xFFEDE9FF),
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Today Meeting Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Today Meeting',
                            style: TextStyle(
                              color: Color(0xFF101828),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFEBE9FE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Color(0xFF7A5AF8),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Your schedule for the day',
                        style: TextStyle(
                          color: Color(0xFF475467),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Meeting Detail
                      Container(
                        width: double.infinity,
                        height: 86,
                        padding: const EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF9FAFB),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFEAECF0),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/meeting.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 6),
                                const Expanded(
                                  child: Text(
                                    'Townhall Meeting',
                                    style: TextStyle(
                                      color: Color(0xFF2A2A2A),
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '01:30 AM - 02:00 AM',
                                  style: TextStyle(
                                    color: Color(0xFF475467),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  width: 24,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        width: 0.92,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/team1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  width: 24,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        width: 0.92,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/team2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  width: 24,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        width: 0.92,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/team3.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '+3',
                                  style: TextStyle(
                                    color: Color(0xFF2A2A2A),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 6,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF6938EF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Join Meet',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.5,
                                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
