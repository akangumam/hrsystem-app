import 'package:flutter/material.dart';

class Task {
  final String title;
  final String status; // 'To Do', 'In Progress', 'Done'
  final bool highPriority;
  final String date;
  final int comments;
  final List<String> avatars;

  Task({
    required this.title,
    required this.status,
    this.highPriority = false,
    required this.date,
    required this.comments,
    required this.avatars,
  });
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int selectedTab = 1; // 0: All, 1: In Progress, 2: Finish

  final tasks = [
    Task(
      title: 'Wiring Dashboard Analytics',
      status: 'In Progress',
      highPriority: true,
      date: '27 Sept',
      comments: 2,
      avatars: [
        'assets/avatars/ava1.png',
        'assets/avatars/ava2.png',
        'assets/avatars/ava3.png',
      ],
    ),
    Task(
      title: 'API Dashboard Analytics Integration',
      status: 'In Progress',
      highPriority: true,
      date: '27 Sept',
      comments: 2,
      avatars: [
        'assets/avatars/ava1.png',
        'assets/avatars/ava2.png',
        'assets/avatars/ava3.png',
      ],
    ),
    Task(
      title: 'Prepare Project Docs',
      status: 'To Do',
      date: '30 Sept',
      comments: 0,
      avatars: ['assets/avatars/ava2.png'],
    ),
    Task(
      title: 'Deploy Sprint Demo',
      status: 'Done',
      date: '24 Sept',
      comments: 1,
      avatars: ['assets/avatars/ava3.png'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final statusTab = ['All', 'In Progress', 'Finish'];
    final taskCounts = {
      'To Do': tasks.where((t) => t.status == 'To Do').length,
      'In Progress': tasks.where((t) => t.status == 'In Progress').length,
      'Done': tasks.where((t) => t.status == 'Done').length,
    };
    final filtered =
        selectedTab == 0
            ? tasks
            : tasks
                .where(
                  (t) =>
                      (selectedTab == 1 && t.status == 'In Progress') ||
                      (selectedTab == 2 && t.status == 'Done'),
                )
                .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFF7A5AF8),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 28,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '08:15',
                      style: TextStyle(fontSize: 17, color: Colors.white70),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Challanges Awaiting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Let's tackle your to do list",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Summary Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Summary of Your Work',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Your current task progress',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _SummaryItem(
                            icon: Icons.code,
                            label: 'To Do',
                            count: taskCounts['To Do'] ?? 0,
                            color: Color(0xFF7A5AF8),
                          ),
                          _SummaryItem(
                            icon: Icons.access_time_rounded,
                            label: 'In Progress',
                            count: taskCounts['In Progress'] ?? 0,
                            color: Color(0xFFF9A826),
                          ),
                          _SummaryItem(
                            icon: Icons.done,
                            label: 'Done',
                            count: taskCounts['Done'] ?? 0,
                            color: Color(0xFF19C37D),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Sprint Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Sprint 20 - Burnout Stats',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF19C37D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            child: const Text(
                              'Good',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "You've completed 4 more tasks than usual, maintain your task with your supervisor",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.sentiment_satisfied_alt,
                            color: Color(0xFF19C37D),
                            size: 30,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Color(0xFFE8E8F0),
                              color: Color(0xFF19C37D),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Filter Tabs
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                child: Row(
                  children: List.generate(3, (i) {
                    final isActive = selectedTab == i;
                    final color =
                        isActive ? const Color(0xFF7A5AF8) : Colors.black12;
                    final textColor = isActive ? Colors.white : Colors.black87;
                    final label = statusTab[i];
                    final badge =
                        i == 0
                            ? tasks.length
                            : (i == 1
                                ? taskCounts['In Progress'] ?? 0
                                : taskCounts['Done'] ?? 0);
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = i),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                label,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              if (badge > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '$badge',
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Task Cards
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
                child: Column(
                  children: [for (final t in filtered) _TaskCard(task: t)],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7A5AF8),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: const Text(
            'Create Task',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final Color color;
  const _SummaryItem({
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.09),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 1),
        Text(
          '$count',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TaskCard extends StatelessWidget {
  final Task task;
  const _TaskCard({required this.task});

  Color get statusColor {
    switch (task.status) {
      case 'To Do':
        return const Color(0xFF7A5AF8);
      case 'In Progress':
        return const Color(0xFFF9A826);
      case 'Done':
        return const Color(0xFF19C37D);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.flash_on, color: statusColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (task.highPriority)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'High',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.11),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: statusColor,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value:
                task.status == 'Done'
                    ? 1.0
                    : (task.status == 'In Progress' ? 0.7 : 0.2),
            backgroundColor: const Color(0xFFE8E8F0),
            color: statusColor,
            minHeight: 3.5,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (final ava in task.avatars)
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(ava),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.black26, size: 19),
                  const SizedBox(width: 5),
                  Text(
                    task.date,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(width: 13),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black26,
                    size: 19,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${task.comments}',
                    style: const TextStyle(color: Colors.black54),
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
