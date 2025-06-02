import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'attendant/attendant_screen.dart';
import 'task/task_screen.dart';
import 'expense/expense_screen.dart';
import 'leave/leave_screen.dart';
import '../widgets/custom_bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AttendantScreen(),
    TaskScreen(),
    ExpenseScreen(),
    LeaveScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F8),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}
