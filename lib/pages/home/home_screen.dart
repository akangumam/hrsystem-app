import 'package:flutter/material.dart';

// HomeScreen
class HomeScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 124,
            color: Colors.white,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/photo_profile.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Khaerul Umam',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF2D2D2D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.verified,
                                size: 18,
                                color: Color(0xFF6E61FF),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Junior Full Stack Developer',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF6E61FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ActionIcon(
                          iconPath: 'assets/icons/chat.png',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 12),
                        _ActionIcon(
                          iconPath: 'assets/icons/notification.png',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // MY WORK SUMMARY CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyWorkSummaryCard(),
          ),

          const SizedBox(height: 16),

          // TODAY MEETING CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Today Meeting',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF101828),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE9FE),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '2',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF7A5AF8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Your schedule for the day',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF667085),
                    ),
                  ),
                  const SizedBox(height: 14),
                  MeetingCard(
                    iconLeading: 'assets/icons/meeting.png',
                    title: 'Townhall Meeting',
                    timeIcon: 'assets/icons/clock.png',
                    timeRange: '01:30 AM - 02:00 AM',
                    participants: ['team1.png', 'team2.png', 'team3.png'],
                    backgroundColor: Color(0xFFFFFFFF),
                    participantsCount: 6, // contoh
                  ),
                  const SizedBox(height: 12),
                  MeetingCard(
                    iconLeading: 'assets/icons/meeting.png',
                    title: 'Dashboard Report',
                    timeIcon: 'assets/icons/clock.png',
                    timeRange: '03:00 PM - 04:00 PM',
                    participants: ['team1.png', 'team2.png', 'team3.png'],
                    backgroundColor: Color(0xFFFFFFFF),
                    participantsCount: 3,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // TODAY TASK CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Today Task',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF101828),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE9FE),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF7A5AF8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'The tasks assigned to you for today',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF667085),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // --- TASK CARD ---
                  TaskCard(
                    iconLeading: 'assets/icons/task.png',
                    title: 'Wiring Dashboard Analytics',
                    status1: 'In Progress',
                    status1Color: Color(0xFF7A5AF8),
                    status2: 'High',
                    flagAsset: 'assets/icons/flag.png',
                    status2Color: Color(0xFFFB4E4E),
                    progress: 0.75,
                    participants: ['team1.png', 'team2.png', 'team3.png'],
                    deadline: '27 April',
                    comments: 2,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ActionIcon Custom
class _ActionIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  // ignore: use_super_parameters
  const _ActionIcon({Key? key, required this.iconPath, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F5FF),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Image.asset(iconPath, width: 20, height: 20),
        onPressed: onPressed,
      ),
    );
  }
}

// MyWorkSummaryCard
class MyWorkSummaryCard extends StatelessWidget {
  const MyWorkSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF785FFB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 16,
            top: 28,
            child: Text(
              'My Work Summary',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          const Positioned(
            left: 16,
            top: 50,
            child: Text(
              'Today task & presence activity',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xFFEDE9FF),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          Positioned(
            left: 285,
            top: 3,
            child: Container(
              width: 101,
              height: 85,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/cctv.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // ... Bubbles & Sparkle decorations can be added as in your previous code ...
        ],
      ),
    );
  }
}

// MeetingCard
class MeetingCard extends StatelessWidget {
  final String iconLeading;
  final String title;
  final String timeIcon;
  final String timeRange;
  final List<String> participants;
  final int participantsCount;
  final Color backgroundColor;

  // ignore: use_super_parameters
  const MeetingCard({
    Key? key,
    required this.iconLeading,
    required this.title,
    required this.timeIcon,
    required this.timeRange,
    required this.participants,
    required this.backgroundColor,
    required this.participantsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E5ED), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconLeading, width: 24, height: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2A2A2A),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Image.asset(timeIcon, width: 16, height: 16),
              const SizedBox(width: 4),
              Text(
                timeRange,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475467),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...participants.map(
                (img) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/$img',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (participantsCount > participants.length)
                Text(
                  '+${participantsCount - participants.length}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2A2A2A),
                    letterSpacing: -0.5,
                  ),
                ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF7A5AF8),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  'Join Meet',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// TaskCard
class TaskCard extends StatelessWidget {
  final String iconLeading;
  final String title;
  final String status1;
  final Color status1Color;
  final String status2;
  final String flagAsset;
  final Color status2Color;
  final double progress; // 0.0 - 1.0
  final List<String> participants;
  final String deadline;
  final int comments;

  const TaskCard({
    super.key,
    required this.iconLeading,
    required this.title,
    required this.status1,
    required this.status1Color,
    required this.status2,
    required this.flagAsset,
    required this.status2Color,
    required this.progress,
    required this.participants,
    required this.deadline,
    required this.comments,
  });

  // Widget untuk badge custom High
  Widget highFlagBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFFF95555),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: 10,
            height: 10,
            child: Image.asset(
              'assets/icons/flag.png',
              width: 10,
              height: 10,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 2),
          const Text(
            'High',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E5ED), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: icon + title
          Row(
            children: [
              Image.asset(iconLeading, width: 20, height: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF2A2A2A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Status badges
          Row(
            children: [
              // Label "In Progress" dengan icon time_progress.png
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: status1Color.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    if (status1 == 'In Progress') ...[
                      Image.asset(
                        'assets/icons/time_progress.png',
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      status1,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: status1Color,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Pakai badge custom jika status2 == 'High'
              status2 == 'High'
                  ? highFlagBadge()
                  : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: status2Color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Image.asset(flagAsset, width: 13, height: 13),
                        const SizedBox(width: 4),
                        Text(
                          status2,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: status2Color,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress bar
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E7EF),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width * 0.6 * progress,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A5AF8),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Avatars, date, comment (custom icon asset)
          Row(
            children: [
              ...participants.map(
                (img) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/$img',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/calendar_card.png',
                    width: 16,
                    height: 16,
                    color: const Color(0xFF667085),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    deadline,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xFF667085),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/message_card.png',
                    width: 16,
                    height: 16,
                    color: const Color(0xFF667085),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$comments',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xFF667085),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
