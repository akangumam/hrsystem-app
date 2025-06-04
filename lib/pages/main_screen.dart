import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'attendant/attendant_screen.dart';
import 'task/task_screen.dart';
import 'expense/expense_screen.dart';
import 'leave/leave_screen.dart';
import '../widgets/custom_bottom_navbar.dart'; // Pastikan path sudah benar

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screen widgets for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    AttendantScreen(),
    TaskScreen(),
    ExpenseScreen(),
    LeaveScreen(),
  ];

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
