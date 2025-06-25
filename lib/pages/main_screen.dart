import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'attendant/attendant_screen.dart';
import 'task/task_screen.dart';
import 'expense/expense_screen.dart';
import 'leave/leave_screen.dart';
import '../widgets/custom_bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  final List<Widget> _screens = [
    HomeScreen(),
    AttendantScreen(),
    TaskScreen(),
    ExpenseScreen(),
    LeaveScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
      ),
    );
  }
}
